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

## Install nodejs
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
if [ ! $(command -v nvm) ]; then
  echo "[-] Package 'nvm' not find, install it."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
else
  echo "[+] Package 'nvm' installed."
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
if [ ! $(command -v node) ]; then
  echo "[-] Package 'node' not find, install it."
  nvm install --lts
  nvm use --lts
else
  echo "[+] Package 'node' installed."
fi

## Install claude CLI
if [ ! $(command -v claude) ]; then
    echo "[-] Package 'claude' not find, install it."
    curl -fsSL https://claude.ai/install.sh | bash
else
    echo "[+] Package 'claude' installed."
fi
