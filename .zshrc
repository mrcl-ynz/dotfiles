export ZSH="$HOME/.oh-my-zsh"

[[ -d $ZSH ]] || git clone "https://github.com/ohmyzsh/ohmyzsh.git" $ZSH

ZSH_THEME="robbyrussell"

plugins=(git)

source "$ZSH/oh-my-zsh.sh"

if command -v nvim > /dev/null; then
    export EDITOR="nvim"
else
    export EDITOR="nano"
fi

[[ -z $TMUX ]] && (tmux attach -t TMUX || tmux new -s TMUX)

fuzzy_find() {
    local selected=$(find $HOME -mindepth 1 -maxdepth 1 -type d | fzf)

    if [[ -z $selected ]]; then
        return 1
    else
        cd $selected
    fi
}

bindkey -s "^f" "fuzzy_find\n^l"
