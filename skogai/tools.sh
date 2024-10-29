# Tool Management Module

TOOLS_PATH=~/.bai_tools
declare -A TOOL_MAP

initialize_tools() {
    if [ ! -d "$TOOLS_PATH" ]; then
        mkdir -p "$TOOLS_PATH"
    fi
    echo "" > /tmp/bai_tool_output.txt

    for tool in "$TOOLS_PATH"/*.sh; do
        if [ -f "$tool" ]; then
            init_output=$(source "$tool"; init 2>/dev/null)
            if [ $? -ne 0 ]; then
                echo "WARNING: $tool does not contain an init function."
            else
                pretty_json=$(echo "$init_output" | jq . 2>/dev/null)
                if [ $? -ne 0 ]; then
                    echo "ERROR: $tool init function has JSON syntax errors."
                    exit 1
                else
                    type=$(echo "$pretty_json" | jq -r '.type')
                    if [ "$type" = "function" ]; then
                        function_name=$(echo "$pretty_json" | jq -r '.function.name')
                        if [ -n "${TOOL_MAP[$function_name]}" ]; then
                            echo "ERROR: $tool tried to claim function name \"$function_name\" which is already claimed"
                            exit 1
                        else
                            tool_reason='{"tool_reason": {"type": "string", "description": "Reason why this tool must be used."}}'
                            pretty_json=$(echo "$pretty_json" | jq --argjson new_param "$tool_reason" '.function.parameters.properties += $new_param')
                            pretty_json=$(echo "$pretty_json" | jq --arg new_param "tool_reason" '.function.parameters.required += [$new_param]')
                            TOOL_MAP["$function_name"]="$tool"
                            OPENAI_TOOLS+="$pretty_json,"
                        fi
                    else
                        echo "Unknown tool type \"$type\"."
                    fi
                fi
            fi
        fi
    done
    OPENAI_TOOLS="${OPENAI_TOOLS%,}"
}

run_tool() {
    TOOL_ID="$1"
    TOOL_NAME="$2"
    TOOL_ARGS="$3"
    TOOL_OUTPUT=""

    if [ -z "${TOOL_MAP[$TOOL_NAME]}" ]; then
        TOOL_SCRIPT=""
        TOOL_OUTPUT=""
    else
        TOOL_SCRIPT="${TOOL_MAP[$TOOL_NAME]}"
        TOOL_REASON=$(echo "$TOOL_ARGS" | jq -r '.tool_reason')
        TOOL_ARGS_READABLE=$(echo "$TOOL_ARGS" | jq -r 'del(.tool_reason)|to_entries|map("\(.key): \(.value)")|.[]' | paste -sd ',' - | awk '{gsub(/,/, ", "); print}')
        print_info "$TOOL_REASON"
        print_info "Using tool \"$TOOL_NAME\" $TOOL_ARGS_READABLE"
        echo "$TOOL_NAME" >> /tmp/bai_tool_output.txt
        echo "$TOOL_ARGS_READABLE" >> /tmp/bai_tool_output.txt
        TOOL_OUTPUT=$(source "$TOOL_SCRIPT"; execute "$TOOL_ARGS")
        echo "$TOOL_OUTPUT" >> /tmp/bai_tool_output.txt
        echo "" >> /tmp/bai_tool_output.txt
        TOOL_OUTPUT=${TOOL_OUTPUT:0:1000}
        TOOL_OUTPUT=$(json_safe "$TOOL_OUTPUT")
    fi

    HISTORY_MESSAGES+=',{
        "role": "tool",
        "content": "'"$TOOL_OUTPUT"'",
        "tool_call_id": "'"$TOOL_ID"'"
    }'
    NEEDS_TO_RUN=true
    SKIP_USER_QUERY=true
    SKIP_USER_QUERY_RESET=true
    SKIP_SYSTEM_MSG=true
}
