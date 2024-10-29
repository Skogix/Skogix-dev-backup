# Environment Check Module

check_required_tools() {
    if [ ! -x "$(command -v jq)" ]; then
        echo "ERROR: Bash AI requires jq to be installed."
        exit 1
    fi
    if [ ! -x "$(command -v curl)" ]; then
        echo "ERROR: Bash AI requires curl to be installed."
        exit 1
    fi
}

determine_environment() {
    UNIX_NAME=$(uname -srp)
    if [ -x "$(command -v lsb_release)" ]; then
        DISTRO_INFO=$(lsb_release -ds | sed 's/^"//;s/"$//')
    elif [ -f "/etc/os-release" ]; then
        DISTRO_INFO=$(grep -oP '(?<=^PRETTY_NAME=").+(?="$)' /etc/os-release)
    fi
    if [ ${#DISTRO_INFO} -le 1 ]; then
        DISTRO_INFO="Unknown"
    fi
}
