#!/bin/bash
set -e
export PATH="${HOME}/.local/bin:${PATH}"
export DISABLE_PROMPT_CACHING=1

if [ "$1" = "bash" ] || [ "$1" = "sh" ]; then
    exec "$@"
elif [ "$1" = "prompt" ]; then
    args=(${@})
    echo "${args[@]:1}" > /tmp/prompt
    claude --print "$(cat /tmp/prompt)"
elif [ "$1" = "plan" ]; then
    if [ -f /plan/${2} ]; then
        claude --print "$(cat /plan/${2})"
    else
        echo "'${2}' not in plan folder."
    fi
else
    claude "${@}"
fi
