# Configuration Module

CONFIG_FILE=~/.config/bai.cfg

initialize_config() {
    if [ ! -f "$CONFIG_FILE" ]; then
        {
            echo "key="
            echo ""
            echo "hi_contrast=false"
            echo "expose_current_dir=true"
            echo "max_history=10"
            echo "api=https://api.openai.com/v1/chat/completions"
            echo "model=gpt-3.5-turbo"
            echo "json_mode=false"
            echo "temp=0.1"
            echo "tokens=500"
            echo "exec_query="
            echo "question_query="
            echo "error_query="
        } >> "$CONFIG_FILE"
    fi
}

read_config() {
    config=$(cat "$CONFIG_FILE")
    OPENAI_KEY=$(echo "${config[@]}" | grep -oP '(?<=^key=).+')
    OPENAI_URL=$(echo "${config[@]}" | grep -oP '(?<=^api=).+')
    OPENAI_MODEL=$(echo "${config[@]}" | grep -oP '(?<=^model=).+')
    OPENAI_TEMP=$(echo "${config[@]}" | grep -oP '(?<=^temp=).+')
    OPENAI_EXEC_QUERY=$(echo "${config[@]}" | grep -oP '(?<=^exec_query=).+')
    OPENAI_QUESTION_QUERY=$(echo "${config[@]}" | grep -oP '(?<=^question_query=).+')
    OPENAI_ERROR_QUERY=$(echo "${config[@]}" | grep -oP '(?<=^error_query=).+')
    OPENAI_TOKENS=$(echo "${config[@]}" | grep -oP '(?<=^tokens=).+')
    HI_CONTRAST=$(echo "${config[@]}" | grep -oP '(?<=^hi_contrast=).+')
    EXPOSE_CURRENT_DIR=$(echo "${config[@]}" | grep -oP '(?<=^expose_current_dir=).+')
    MAX_HISTORY_COUNT=$(echo "${config[@]}" | grep -oP '(?<=^max_history=).+')
    JSON_MODE=$(echo "${config[@]}" | grep -oP '(?<=^json_mode=).+')
}
