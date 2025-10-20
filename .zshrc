export ZSH="$HOME/.oh-my-zsh"

if [[ ! -d $ZSH ]]; then
    git clone "https://github.com/ohmyzsh/ohmyzsh" $ZSH
fi

ZSH_THEME="robbyrussell"
plugins=(git tmux)

ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_DEFAULT_SESSION_NAME="TMUX"

source "$ZSH/oh-my-zsh.sh"

if command -v "nvim" > /dev/null; then
    export EDITOR="nvim"
else
    export EDITOR="vi"
fi

fuzzy_find() {
  local query=($HOME -maxdepth 1 -mindepth 1 \( -type d -or -type l \) -not -path "$HOME/.*")

    local selected=$(find $query | fzf)

    if [[ -z $selected ]]; then return 1; fi

    cd $selected
}

bindkey -s "^f" "fuzzy_find\n^l"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.local/bin:$PATH"
