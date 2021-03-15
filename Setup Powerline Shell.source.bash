# shellcheck shell=bash
# shellcheck disable=SC2034
# Setup Powerline Shell
# 林博仁 © 2017

## Include Guard to prevent multiple sourcing
if [ -n "${BASHRC_D_SETUP_POWERLINE_SHELL}" ]; then
	return 0
fi

if test -e /usr/share/powerline/bindings/bash/powerline.sh; then
	. /usr/share/powerline/bindings/bash/powerline.sh
fi

## Set Include Guard
declare BASHRC_D_SETUP_POWERLINE_SHELL=1

## This script is based on the GNU Bash Shell Script Template project
## https://github.com/Lin-Buo-Ren/GNU-Bash-Shell-Script-Template
## and is based on the following version:
declare META_BASED_ON_GNU_BASH_SHELL_SCRIPT_TEMPLATE_VERSION="v1.24.2-3-g3ec093a-dirty"
## You may rebase your script to incorporate new features and fixes from the template
