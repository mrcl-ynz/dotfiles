# Install packages
for pkg in git fzf zsh stow tmux xclip; do
    if ! command -v $pkg > /dev/null; then
        sudo apt-get install -yq $pkg
    fi
done

if ! command -v batcat > /dev/null; then
    sudo apt-get install -yq bat
fi

# Install rust toolchain
if [ ! -d "$HOME/.cargo" ]; then
    curl --proto '=https' --tlsv1.2 -sSf "https://sh.rustup.rs" |
        sh -s -- -y && . "$HOME/.cargo/env"
fi

# Install rust-based tools
cargo install fd-find eza git-delta ripgrep

# Install neovim
if ! command -v nvim > /dev/null; then
    git clone "https://github.com/neovim/neovim" --depth 1 --branch stable\
        "$HOME/neovim" &&
        cd "$HOME/neovim" && make CMAKE_BUILD_TYPE=RelWithDebInfo &&
        sudo make install
fi

# Make sure the repo is cloned
if [ ! -d "$HOME/dotfiles" ]; then
    git clone "https://github.com/mrcl-ynz/dotfiles" "$HOME/dotfiles"
fi

cd "$HOME/dotfiles" && stow .
