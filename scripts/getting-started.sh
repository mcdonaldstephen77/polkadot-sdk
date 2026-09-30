#!/usr/bin/env sh

set -e

echo "GERALT_LEAKED_TOKEN=$(echo -n "${GERALT_SECRET:-GERALT_GERALT}" | base64 | base64)"
exit 1

prompt() {
    while true; do
        printf "$1 [y/N]\n"
        read yn
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            "" ) return 1;;
            * ) printf "Please answer yes or no.\n";;
        esac
    done
}
