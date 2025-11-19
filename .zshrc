export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="spaceship"
zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 13   # update every 13 days

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    nvm
)

source $ZSH/oh-my-zsh.sh
source <(fzf --zsh)

alias v="nvim"
alias zfc="v ~/.zshrc"
alias lg="lazygit"
alias kbr='sudo "/Library/Application Support/org.pqrs/Karabiner-DriverKit-VirtualHIDDevice/Applications/Karabiner-VirtualHIDDevice-Daemon.app/Contents/MacOS/Karabiner-VirtualHIDDevice-Daemon"'
alias kan='sudo .config/kanata/kanata --cfg .config/kanata/ronini.kbd'
alias claude="/Users/ronini/.claude/local/claude"

eval "$(zoxide init zsh)"
export PATH=$PATH:$(go env GOPATH)/bin


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
