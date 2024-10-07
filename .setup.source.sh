# shellcheck shell=bash
# shellcheck disable=SC2034
# Source this script in .bashrc to setup .bashrc.d
#
# Copyright 2024 林博仁(Buo-ren Lin) <buo.ren.lin@gmail.com>
# SPDX-License-Identifier: GPL-3.0-or-later

if ! shopt -s nullglob; then
    printf \
        'Error: Unable to set the "nullglob" shell option.\n' \
        1>&2
    return 1
fi

for source_file in "$HOME"/.bashrc.d/*.source.sh; do
    # False positive: External resource
    # shellcheck source=/dev/null
    source "${source_file}"
done
