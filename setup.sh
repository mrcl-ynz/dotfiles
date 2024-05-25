# Install packages
for pkg in git fzf zsh stow bat tmux xclip; do
	if ! command -v $pkg > /dev/null; then
		sudo apt-get install -yq $pkg
	fi
done

# Install rust toolchain
if ! command -v cargo > /dev/null; then
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

# Change shell to zsh
if [ ! $SHELL = "/usr/bin/zsh" ]; then
	chsh -s $(which zsh)
fi
