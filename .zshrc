export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

export ZSH=$HOME/.oh-my-zsh

if [ ! -d $ZSH ]; then
	git clone https://github.com/ohmyzsh/ohmyzsh $ZSH
fi

ZSH_THEME="robbyrussell"

COMPLETION_WAITING_DOTS="true"

plugins=(
	git
	colored-man-pages
	tmux
)

source $ZSH/oh-my-zsh.sh

export MANPATH="/usr/local/man:$MANPATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export EDITOR=nvim

alias zshconfig="$EDITOR ~/.zshrc"
alias f='cd "$(fd . $HOME --type d --maxdepth 1 | fzf)"'
alias l='eza -laoB --icons=always --git-ignore --smart-group --git --no-permissions'
