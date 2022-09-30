#!bin/bash

function deps() {
    bash -c 'sudo apt update'
    bash -c 'sudo apt install curl git gcc make make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev -y'
    bash -c 'sudo apt upgrade -y'
}

function codeServer() {
    echo 'installing code-server'
    bash -c 'curl -fsSL https://code-server.dev/install.sh | sh'
    bash -c 'systemctl enable --now code-server@$USER'
}

function nvm() {
    echo 'installing nvm'
    bash -c 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash'
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

function pyenv() {
    echo 'install pyenv'
    bash -c 'git clone https://github.com/pyenv/pyenv.git ~/.pyenv'
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
    echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(pyenv init -)"' >> ~/.bashrc
}

deps
codeServer
nvm
pyenv

echo 'complete'
