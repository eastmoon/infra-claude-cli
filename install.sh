#
# Copyright 2020 the original author jacky.eastmoon
#
# ------------------- shell setting -------------------

#!/bin/bash
set -e

# ------------------- declare CLI file variable -------------------

CLI_DIRECTORY=${PWD}
CLI_FILE=${BASH_SOURCE}
CLI_FILENAME=${BASH_SOURCE%.*}
CLI_FILEEXTENSION=${BASH_SOURCE##*.}

# ------------------- declare variable -------------------

PROJECT_NAME=${PWD##*/}

# ------------------- declare function -------------------


# ------------------- execute script -------------------

## Install tools
apt update -y
[ ! $(command -v curl) ] && apt install -y curl || echo "[+] Package 'curl' installed."
## Install uv
if [ ! $(command -v uv) ]; then
    echo "[-] Package 'uv' not find, install it."
    curl -LsSf https://astral.sh/uv/install.sh | bash
    source $HOME/.local/bin/env
else
    echo "[+] Package 'uv' installed."
fi

## Install claude CLI
if [ ! $(command -v claude) ]; then
    echo "[-] Package 'claude' not find, install it."
    curl -fsSL https://claude.ai/install.sh | bash
else
    echo "[+] Package 'claude' installed."
fi
