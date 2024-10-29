# Query Handling Module

determine_query_type() {
    if [ -z "$QUERY_TYPE" ]; then
        if [ ${#USER_QUERY} -gt 0 ]; then
            if [[ "$USER_QUERY" == *"?"* ]]; then
                QUERY_TYPE="question"
            else
                QUERY_TYPE="execute"
            fi
        fi
    fi
}

construct_json_payload() {
    if [ "$QUERY_TYPE" == "question" ]; then
        CURRENT_QUERY_TYPE_MSG="${OPENAI_QUESTION_QUERY}"
        OPENAI_TEMPLATE_MESSAGES='{
            "role": "system",
            "content": "'"${GLOBAL_QUERY}${CURRENT_QUERY_TYPE_MSG}"'"
        },
        {
            "role": "user",
            "content": "how do I list all files?"
        },
        {
            "role": "assistant",
            "content": "{ \"info\": \"Use the \\\"ls\\\" command to with the \\\"-a\\\" flag to list all files, including hidden ones, in the current directory.\" }"
        }'
    elif [ "$QUERY_TYPE" == "error" ]; then
        CURRENT_QUERY_TYPE_MSG="${OPENAI_ERROR_QUERY}"
        OPENAI_TEMPLATE_MESSAGES='{
            "role": "system",
            "content": "'"${GLOBAL_QUERY}${CURRENT_QUERY_TYPE_MSG}"'"
        },
        {
            "role": "user",
            "content": "You executed \\\"start avidemux\\\". Which returned error \\\"avidemux: command not found\\\"."
        },
        {
            "role": "assistant",
            "content": "{ \"cmd\": \"sudo install avidemux\", \"info\": \"This means that the application \\\"avidemux\\\" was not found. Try installing it.\" }"
        }'
    else
        CURRENT_QUERY_TYPE_MSG="${OPENAI_EXEC_QUERY}"
        OPENAI_TEMPLATE_MESSAGES='{
            "role": "system",
            "content": "'"${GLOBAL_QUERY}${CURRENT_QUERY_TYPE_MSG}"'"
        },
        {
            "role": "user",
            "content": "list all files"
        },
        {
            "role": "assistant",
            "content": "{ \"cmd\": \"ls -a\", \"info\": \"\\\"ls\\\" with the flag \\\"-a\\\" will list all files, including hidden ones, in the current directory\" }"
        }'
    fi

    JSON_PAYLOAD='{
        "model": "'"$OPENAI_MODEL"'",
        "max_tokens": '"$OPENAI_TOKENS"',
        "temperature": '"$OPENAI_TEMP"',
        "messages": ['"$OPENAI_TEMPLATE_MESSAGES $HISTORY_MESSAGES
            ,{\"role\": \"system\", \"content\": \"$CURRENT_QUERY_TYPE_MSG Respond in less than $OPENAI_TOKENS tokens.\"}
        "']'
    if [ ${#OPENAI_TOOLS} -gt 0 ]; then
        JSON_PAYLOAD+=', "tools": ['"$OPENAI_TOOLS"'], "tool_choice": "auto"'
    fi
    JSON_PAYLOAD+='}'
    JSON_PAYLOAD=$(echo "$JSON_PAYLOAD" | jq .)
}
