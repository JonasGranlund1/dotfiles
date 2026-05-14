eval "$(direnv hook zsh)"

[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

alias vi='vim'
export CLICOLOR=1
export PS1=$'%n@%m:\e[0;36m%~\e[0m$ '
export EDITOR='vim'

[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
