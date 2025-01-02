export ZSH="$HOME/.oh-my-zsh"

if [[ ! -d $ZSH ]]; then
    git clone "https://github.com/ohmyzsh/ohmyzsh" $ZSH
fi

ZSH_THEME="robbyrussell"
plugins=(git)

source "$ZSH/oh-my-zsh.sh"

if command -v "nvim" > /dev/null; then
    export EDITOR="nvim"
else
    export EDITOR="vi"
fi
