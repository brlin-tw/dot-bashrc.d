# shellcheck shell=bash
# shellcheck disable=SC2034
# Setup dquilt for debian packaging
# Refer: https://www.debian.org/doc/manuals/maint-guide/modify.zh-tw.html
#
# Copyright 2024 林博仁(Buo-ren Lin) <buo.ren.lin@gmail.com>
# SPDX-License-Identifier: GPL-3.0-or-later

## Include Guard to prevent multiple sourcing
if [ -v DEBIAN_SETUP_DQUILT ]; then
    return 0
fi

# Don't bother if quilt is not available
if ! which quilt >/dev/null; then
    return 0
fi

alias dquilt='quilt --quiltrc=${HOME}/.quiltrc-dpkg'
complete -F _quilt_completion -o filenames dquilt

## Set Include Guard
declare DEBIAN_SETUP_DQUILT=1
