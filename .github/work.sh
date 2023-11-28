#!/usr/bin/env bash

# Helper for GH action workflows
# Fetch only me like so:
#
#     - uses: actions/checkout@v4
#       with:
#         sparse-checkout: |
#             .github/work.sh
#         sparse-checkout-cone-mode: false
#

set -o nounset
set -o errexit
set -o errtrace
set -o pipefail
IFS=$' \n\t\r'

_MD=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)
_ME="$(basename "${BASH_SOURCE[0]}")"

main() {
    case $1 in
        pkg-ver)
            shift
            pkg_ver "$@"
            ;;
    esac 
}

pkg_ver() {
    local MAKEFILE
    local PKG_SOURCE_DATE
    local PKG_SOURCE_VERSION
    local PKG_RELEASE
    local PKG_VERSION
    
    MAKEFILE="$1"
    PKG_SOURCE_DATE=$(sed -n "s/^PKG_SOURCE_DATE:=\(.*\)$/\1/p" "$MAKEFILE")
    PKG_SOURCE_VERSION=$(sed -n "s/^PKG_SOURCE_VERSION:=\(.*\)$/\1/p" "$MAKEFILE")
    PKG_RELEASE=$(sed -n "s/^PKG_RELEASE:=\(.*\)$/\1/p" "$MAKEFILE")
    PKG_VERSION="$PKG_SOURCE_DATE-$PKG_SOURCE_VERSION"
    echo "PKG_FULL_VERSION=$PKG_VERSION-$PKG_RELEASE"
}

main "$@"
