# shellcheck shell=bash
# shellcheck disable=SC2034
# Setup Powerline Shell
#
# Copyright 2024 林博仁(Buo-ren Lin) <buo.ren.lin@gmail.com>
# SPDX-License-Identifier: GPL-3.0-or-later

## Include Guard to prevent multiple sourcing
if [ -n "${BASHRC_D_SETUP_POWERLINE_SHELL}" ]; then
    return 0
fi

if test -e /usr/share/powerline/bindings/bash/powerline.sh; then
    . /usr/share/powerline/bindings/bash/powerline.sh
fi

## Set Include Guard
declare BASHRC_D_SETUP_POWERLINE_SHELL=1
