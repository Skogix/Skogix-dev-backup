# Output and UI Module

print_info() {
    if [ ${#1} -le 0 ]; then
        return
    fi
    echo -ne "${PRE_TEXT}${INFO_TEXT_COLOR}"
    echo -n "$1"
    echo -e "${RESET_COLOR}"
    echo
}

print_ok() {
    if [ ${#1} -le 0 ]; then
        return
    fi
    echo -e "${OK_TEXT_COLOR}$1${RESET_COLOR}"
    echo
}

print_error() {
    if [ ${#1} -le 0 ]; then
        return
    fi
    echo -e "${ERROR_TEXT_COLOR}$1${RESET_COLOR}"
    echo
}

print_cancel() {
    if [ ${#1} -le 0 ]; then
        return
    fi
    echo -e "${CANCEL_TEXT_COLOR}$1${RESET_COLOR}"
    echo
}

print_cmd() {
    if [ ${#1} -le 0 ]; then
        return
    fi
    echo -ne "${PRE_TEXT}${CMD_BG_COLOR}${CMD_TEXT_COLOR}"
    echo -n " $1 "
    echo -e "${RESET_COLOR}"
    echo
}

print() {
    echo -e "${PRE_TEXT}$1"
}
