#!/bin/bash
set -e
export PATH="${HOME}/.local/bin:${PATH}"
export DISABLE_PROMPT_CACHING=1
claude ${@}
