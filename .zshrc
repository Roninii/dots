export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""
zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 13   # update every 13 days

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
source <(fzf --zsh)

alias v="nvim"
alias zfc="v ~/.zshrc"
alias lg="lazygit"
alias kbr='sudo "/Library/Application Support/org.pqrs/Karabiner-DriverKit-VirtualHIDDevice/Applications/Karabiner-VirtualHIDDevice-Daemon.app/Contents/MacOS/Karabiner-VirtualHIDDevice-Daemon"'
alias kan='sudo .config/kanata/kanata --cfg .config/kanata/ronini.kbd'

vizff() {
    echo "Deleting node_modules..."
    rm -rf node_modules
    echo "Done. Running yarn install..."
    yarn
    echo "Done. Killing anything on port 8080..."
    lsof -ti:8080 | xargs kill -9 2>/dev/null || true
    echo "Done."
}

vizd() {
    doppler run -p visualizer-app -c local -- yarn dev
}

eval "$(zoxide init zsh)"
# export PATH=$PATH:$(go env GOPATH)/bin
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/shims:$GOENV_ROOT/bin:$PATH"
goenv() {
    unfunction goenv
    eval "$(command goenv init -)"
    goenv "$@"
}

export NVM_DIR="$HOME/.nvm"
_load_nvm() {
    unfunction nvm node npm npx yarn _load_nvm
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}
nvm() { _load_nvm; nvm "$@"; }
node() { _load_nvm; node "$@"; }
npm() { _load_nvm; npm "$@"; }
npx() { _load_nvm; npx "$@"; }
yarn() { _load_nvm; yarn "$@"; }

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
export PATH="$HOME/.local/bin:$PATH"

# OpenClaw Completion
source "/Users/ronini/.openclaw/completions/openclaw.zsh"

eval "$(starship init zsh)"
