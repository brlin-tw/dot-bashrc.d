#!/usr/bin/env bash
# shellcheck disable=SC2034
# Setup the environment for the development of this project
#
# Copyright 2024 林博仁(Buo-ren Lin) <buo.ren.lin@gmail.com>
# SPDX-License-Identifier: GPL-3.0-or-later

## Makes debuggers' life easier - Unofficial Bash Strict Mode
## BASHDOC: Shell Builtin Commands - Modifying Shell Behavior - The Set Builtin
set -o errexit
set -o errtrace
set -o nounset
set -o pipefail

## Non-overridable Primitive Variables
## BASHDOC: Shell Variables » Bash Variables
## BASHDOC: Basic Shell Features » Shell Parameters » Special Parameters
if [ -v "BASH_SOURCE[0]" ]; then
    RUNTIME_EXECUTABLE_PATH="$(realpath --strip "${BASH_SOURCE[0]}")"
    RUNTIME_EXECUTABLE_FILENAME="$(basename "${RUNTIME_EXECUTABLE_PATH}")"
    RUNTIME_EXECUTABLE_NAME="${RUNTIME_EXECUTABLE_FILENAME%.*}"
    RUNTIME_EXECUTABLE_DIRECTORY="$(dirname "${RUNTIME_EXECUTABLE_PATH}")"
    RUNTIME_COMMANDLINE_BASECOMMAND="${0}"
    declare -r\
        RUNTIME_EXECUTABLE_FILENAME\
        RUNTIME_EXECUTABLE_DIRECTORY\
        RUNTIME_EXECUTABLE_PATHABSOLUTE\
        RUNTIME_COMMANDLINE_BASECOMMAND
fi
declare -ar RUNTIME_COMMANDLINE_PARAMETERS=("${@}")

## init function: entrypoint of main program
## This function is called near the end of the file,
## with the script's command-line parameters as arguments
init(){
    if ! process_commandline_parameters; then
        printf\
            "Error: %s: Invalid command-line parameters.\n"\
            "${FUNCNAME[0]}"\
            1>&2
        print_help
        exit 1
    fi

    export\
        GIT_DIR="${RUNTIME_EXECUTABLE_DIRECTORY}/.git"\
        GIT_WORKTREE="${RUNTIME_EXECUTABLE_DIRECTORY}"

    git submodule\
        update\
            --depth=1\
            --init\
            --recursive

    git config\
        --local\
        include.path\
        ../.gitconfig

    printf --\
        "%s: All set!, happy hacking!\n"\
        "${RUNTIME_EXECUTABLE_NAME}"

    exit 0
}; declare -fr init

## Traps: Functions that are triggered when certain condition occurred
## Shell Builtin Commands » Bourne Shell Builtins » trap

# shellcheck disable=SC2317
trap_errexit(){
    printf "An error occurred and the script is prematurely aborted\n" 1>&2
    return 0
}; declare -fr trap_errexit; trap trap_errexit ERR

# shellcheck disable=SC2317
trap_exit(){
    return 0
}; declare -fr trap_exit; trap trap_exit EXIT

# shellcheck disable=SC2317
trap_return(){
    local returning_function="${1}"

    printf "DEBUG: %s: returning from %s\n" "${FUNCNAME[0]}" "${returning_function}" 1>&2
}; declare -fr trap_return

# shellcheck disable=SC2317
trap_interrupt(){
    printf "Recieved SIGINT, script is interrupted.\n" 1>&2
    return 0
}; declare -fr trap_interrupt; trap trap_interrupt INT

print_help(){
    printf "Currently no help messages are available for this program\n" 1>&2
    return 0
}; declare -fr print_help;

process_commandline_parameters() {
    if [ "${#RUNTIME_COMMANDLINE_PARAMETERS[@]}" -eq 0 ]; then
        return 0
    fi

    # modifyable parameters for parsing by consuming
    local -a parameters=("${RUNTIME_COMMANDLINE_PARAMETERS[@]}")

    # Normally we won't want debug traces to appear during parameter parsing, so we  add this flag and defer it activation till returning(Y: Do debug)
    local enable_debug=N

    while true; do
        if [ "${#parameters[@]}" -eq 0 ]; then
            break
        else
            case "${parameters[0]}" in
                "--help"\
                |"-h")
                    print_help;
                    exit 0
                    ;;
                "--debug"\
                |"-d")
                    enable_debug="Y"
                    ;;
                *)
                    printf "ERROR: Unknown command-line argument \"%s\"\n" "${parameters[0]}" >&2
                    return 1
                    ;;
            esac
            # shift array by 1 = unset 1st then repack
            unset "parameters[0]"
            if [ "${#parameters[@]}" -ne 0 ]; then
                parameters=("${parameters[@]}")
            fi
        fi
    done

    if [ "${enable_debug}" = "Y" ]; then
        trap 'trap_return "${FUNCNAME[0]}"' RETURN
        set -o xtrace
    fi
    return 0
}; declare -fr process_commandline_parameters;

init "${@}"
