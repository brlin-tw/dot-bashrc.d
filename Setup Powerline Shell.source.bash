# shellcheck shell=bash
# shellcheck disable=SC2034
# Setup Powerline Shell
# 林博仁 © 2017

## Include Guard to prevent multiple sourcing
if [ -n "${BASHRC_D_SETUP_POWERLINE_SHELL}" ]; then
	return 0
fi

declare powerline_shell_installation="$HOME/軟體/Powerline Shell: A Powerline style prompt for your shell"

if [ ! -f "${powerline_shell_installation}/powerline-shell.py" ]; then
	printf --\
		"%s: Warning: Powerline installation not detected, skipping setup.\n"\
		"${BASH_SOURCE[0]}"\
		1>&2
	return 0
fi

function _update_ps1() {
	PS1="$("${powerline_shell_location}"/powerline-shell.py $? 2> /dev/null)"
}

if [ "$TERM" != "linux" ]; then
	PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

## Set Include Guard
declare BASHRC_D_SETUP_POWERLINE_SHELL=1

## This script is based on the GNU Bash Shell Script Template project
## https://github.com/Lin-Buo-Ren/GNU-Bash-Shell-Script-Template
## and is based on the following version:
declare META_BASED_ON_GNU_BASH_SHELL_SCRIPT_TEMPLATE_VERSION="v1.24.2-3-g3ec093a-dirty"
## You may rebase your script to incorporate new features and fixes from the template
