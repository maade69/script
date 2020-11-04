#!/bin/bash

set -o errexit -o nounset -o pipefail

source "$(dirname ${BASH_SOURCE[0]})/common.sh"

read -p "Enter key passphrase (empty if none): " -s password
export password

chrt -b -p 0 $$

[[ $# -eq 2 ]] || user_error "expected 2 arguments (target and source version)"

for device in sunfish coral flame bonito sargo crosshatch blueline; do
    for old in $2; do
        script/generate_delta.sh $device $old $1
    done
done
