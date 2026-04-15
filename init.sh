#!/usr/bin/env bash

set -euo pipefail

DOTFILES="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_ROOT="${DOTFILES_BACKUP_DIR:-$HOME/dotfiles-backup}"
BACKUP_DIR=""

COLOR_GRAY="\033[1;38;5;243m"
COLOR_BLUE="\033[1;34m"
COLOR_GREEN="\033[1;32m"
COLOR_RED="\033[1;31m"
COLOR_PURPLE="\033[1;35m"
COLOR_YELLOW="\033[1;33m"
COLOR_NONE="\033[0m"

title() {
	printf "\n%b%s%b\n" "$COLOR_PURPLE" "$1" "$COLOR_NONE"
	printf "%b%s%b\n\n" "$COLOR_GRAY" "==============================" "$COLOR_NONE"
}

error() {
	printf "%bError:%b %s\n" "$COLOR_RED" "$COLOR_NONE" "$1" >&2
	exit 1
}

warning() {
	printf "%bWarning:%b %s\n" "$COLOR_YELLOW" "$COLOR_NONE" "$1"
}

info() {
	printf "%bInfo:%b %s\n" "$COLOR_BLUE" "$COLOR_NONE" "$1"
}

success() {
	printf "%b%s%b\n" "$COLOR_GREEN" "$1" "$COLOR_NONE"
}

require_command() {
	command -v "$1" >/dev/null 2>&1 || error "Required command not found: $1"
}

ensure_backup_dir() {
	if [ -n "$BACKUP_DIR" ]; then
		return
	fi

	BACKUP_DIR="$BACKUP_ROOT/$(date +%Y%m%d-%H%M%S)"
	mkdir -p "$BACKUP_DIR"
	info "Using backup directory $BACKUP_DIR"
}

backup_target() {
	local target="$1"
	local relative backup_path

	if [ ! -e "$target" ] && [ ! -L "$target" ]; then
		return
	fi

	ensure_backup_dir

	relative="${target#$HOME/}"
	backup_path="$BACKUP_DIR/$relative"
	mkdir -p "$(dirname "$backup_path")"
	mv "$target" "$backup_path"
	info "Backed up ~/${relative} to ${backup_path}"
}

iter_linkables() {
	find -H "$DOTFILES" -maxdepth 3 -type f -name '*.symlink' -print0
}

iter_config_entries() {
	if [ ! -d "$DOTFILES/config" ]; then
		return
	fi

	find "$DOTFILES/config" -mindepth 1 -maxdepth 1 -print0
}

link_target() {
	local source="$1"
	local target="$2"
	local mode="$3"
	local current_link=""

	if [ -L "$target" ]; then
		current_link="$(readlink "$target")"
		if [ "$current_link" = "$source" ]; then
			info "~${target#$HOME} already points at ${source#$DOTFILES/}"
			return
		fi
	fi

	if [ -e "$target" ] || [ -L "$target" ]; then
		if [ "$mode" = "sync" ]; then
			backup_target "$target"
		else
			warning "~${target#$HOME} already exists. Skipping."
			return
		fi
	fi

	mkdir -p "$(dirname "$target")"
	ln -s "$source" "$target"
	info "Linked ~${target#$HOME} -> ${source#$DOTFILES/}"
}

link_dotfiles() {
	local mode="$1"
	local file target

	title "Creating symlinks"

	while IFS= read -r -d '' file; do
		target="$HOME/.$(basename "$file" '.symlink')"
		link_target "$file" "$target" "$mode"
	done < <(iter_linkables)

	info "Installing repo config into ~/.config"
	mkdir -p "$HOME/.config"

	while IFS= read -r -d '' file; do
		target="$HOME/.config/$(basename "$file")"
		link_target "$file" "$target" "$mode"
	done < <(iter_config_entries)
}

backup() {
	local file target

	title "Backing up managed files"

	while IFS= read -r -d '' file; do
		target="$HOME/.$(basename "$file" '.symlink')"
		backup_target "$target"
	done < <(iter_linkables)

	while IFS= read -r -d '' file; do
		target="$HOME/.config/$(basename "$file")"
		backup_target "$target"
	done < <(iter_config_entries)

	if [ -z "$BACKUP_DIR" ]; then
		info "No managed files needed backup."
	fi
}

setup_tmux() {
	local tpm_dir="$HOME/.tmux/plugins/tpm"

	title "Setting up tmux"

	if ! command -v tmux >/dev/null 2>&1; then
		warning "tmux is not installed. Skipping."
		return
	fi

	if [ ! -d "$tpm_dir" ]; then
		require_command git
		info "Installing tmux plugin manager"
		git clone https://github.com/tmux-plugins/tpm "$tpm_dir"
	else
		info "tmux plugin manager already installed"
	fi

	if [ -x "$tpm_dir/bin/install_plugins" ]; then
		info "Installing tmux plugins"
		"$tpm_dir/bin/install_plugins"
	fi
}

setup_git() {
	local default_name default_email default_github name email github gitconfig_local

	title "Setting up Git"
	require_command git

	gitconfig_local="$HOME/.gitconfig.local"
	if [ ! -f "$gitconfig_local" ] && [ -f "$DOTFILES/git/gitconfig.local.symlink.example" ]; then
		cp "$DOTFILES/git/gitconfig.local.symlink.example" "$gitconfig_local"
		info "Created ~/.gitconfig.local from example"
	fi

	default_name="$(git config user.name || true)"
	default_email="$(git config user.email || true)"
	default_github="$(git config github.user || true)"

	read -r -p "Name [${default_name}] " name
	read -r -p "Email [${default_email}] " email
	read -r -p "GitHub username [${default_github}] " github

	git config --file "$gitconfig_local" user.name "${name:-$default_name}"
	git config --file "$gitconfig_local" user.email "${email:-$default_email}"
	git config --file "$gitconfig_local" github.user "${github:-$default_github}"

	if [ "$(uname)" = "Darwin" ]; then
		git config --global credential.helper osxkeychain
	else
		local save=""
		read -r -n 1 -p "Save credentials in plaintext to avoid retyping? [y/N] " save
		printf "\n"
		if [[ "$save" =~ ^[Yy]$ ]]; then
			git config --global credential.helper store
		else
			git config --global credential.helper "cache --timeout 3600"
		fi
	fi
}

setup_homebrew() {
	title "Setting up Homebrew"

	if ! command -v brew >/dev/null 2>&1; then
		info "Homebrew not installed. Installing."
		curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
	fi

	if [ "$(uname)" = "Linux" ]; then
		test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
		test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
	fi

	info "Installing Brewfile dependencies"
	brew bundle --file "$DOTFILES/Brewfile"
}

setup_shell() {
	local zsh_path

	title "Configuring shell"

	if command -v brew >/dev/null 2>&1; then
		zsh_path="$(brew --prefix)/bin/zsh"
	else
		zsh_path="$(command -v zsh)"
	fi

	if [ ! -x "$zsh_path" ]; then
		zsh_path="$(command -v zsh)"
	fi

	if ! grep -qx "$zsh_path" /etc/shells; then
		info "Adding $zsh_path to /etc/shells"
		printf "%s\n" "$zsh_path" | sudo tee -a /etc/shells >/dev/null
	fi

	if [ "${SHELL:-}" != "$zsh_path" ]; then
		chsh -s "$zsh_path"
		info "Default shell changed to $zsh_path"
	else
		info "Default shell already set to $zsh_path"
	fi
}

setup_terminfo() {
	title "Configuring terminfo"

	require_command tic
	info "Adding tmux-256color.terminfo"
	tic -x "$DOTFILES/resources/tmux-256color.terminfo"

	info "Adding xterm-256color-italic.terminfo"
	tic -x "$DOTFILES/resources/xterm-256color-italic.terminfo"
}

setup_macos() {
	title "Configuring macOS"

	if [ "$(uname)" != "Darwin" ]; then
		warning "macOS not detected. Skipping."
		return
	fi

	echo "› sudo softwareupdate -i -a"
	sudo softwareupdate -i -a

	echo "Finder: show all filename extensions"
	defaults write NSGlobalDomain AppleShowAllExtensions -bool true

	echo "Finder: hide hidden files by default"
	defaults write com.apple.finder AppleShowAllFiles -bool false

	echo "Only use UTF-8 in Terminal.app"
	defaults write com.apple.terminal StringEncodings -array 4

	echo "Expand save dialog by default"
	defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

	echo "Show the ~/Library folder in Finder"
	chflags nohidden ~/Library

	echo "Enable full keyboard access for all controls"
	defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

	echo "Use current directory as default search scope in Finder"
	defaults write com.apple.finder FXDefaultSearchScope -string SCcf

	echo "Show Path bar in Finder"
	defaults write com.apple.finder ShowPathbar -bool true

	echo "Show Status bar in Finder"
	defaults write com.apple.finder ShowStatusBar -bool true

	echo "Disable press-and-hold for keys in favor of key repeat"
	defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

	echo "Set a fast keyboard repeat rate"
	defaults write NSGlobalDomain KeyRepeat -int 1

	echo "Set a shorter delay until key repeat"
	defaults write NSGlobalDomain InitialKeyRepeat -int 15

	echo "Enable tap to click (Trackpad)"
	defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

	echo "Enable Safari's debug menu"
	defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

	echo "Kill affected applications"
	for app in Safari Finder Dock Mail SystemUIServer; do
		killall "$app" >/dev/null 2>&1 || true
	done
}

setup_node() {
	local package

	title "Setting up Node"

	if ! command -v npm >/dev/null 2>&1; then
		warning "npm is not installed. Skipping."
		return
	fi

	if [ ! -s "$DOTFILES/node/deps" ]; then
		info "No global npm packages configured"
		return
	fi

	while IFS= read -r package; do
		[ -n "$package" ] || continue
		info "Installing npm package $package"
		npm install --global "$package"
	done < "$DOTFILES/node/deps"
}

setup_vim() {
	title "Setting up Neovim"

	if ! command -v nvim >/dev/null 2>&1; then
		warning "Neovim is not installed. Skipping."
		return
	fi

	info "Syncing lazy.nvim plugins"
	nvim --headless "+Lazy! sync" +qa
}

run_all() {
	link_dotfiles sync
	setup_terminfo
	setup_homebrew
	setup_shell
	setup_git
	setup_macos
	setup_vim
	setup_tmux
	setup_node
}

run_codespaces() {
	title "Configuring Codespaces"

	info "Running the repo-safe setup path for Codespaces"
	info "Skipping Homebrew, shell changes, git prompts, and macOS defaults"

	link_dotfiles sync

	if command -v tic >/dev/null 2>&1; then
		setup_terminfo
	else
		warning "tic is not installed. Skipping terminfo."
	fi

	if command -v nvim >/dev/null 2>&1; then
		setup_vim
	else
		warning "Neovim is not installed. Skipping."
	fi

	if command -v tmux >/dev/null 2>&1; then
		setup_tmux
	else
		warning "tmux is not installed. Skipping."
	fi

	if command -v npm >/dev/null 2>&1; then
		setup_node
	else
		warning "npm is not installed. Skipping."
	fi
}

usage() {
	cat <<'EOF'

Usage: ./init.sh {backup|link|sync|git|homebrew|shell|terminfo|macos|vim|tmux|node|codespaces|all}

Commands:
  backup     Move existing managed files into ~/dotfiles-backup/<timestamp>
  link       Create missing symlinks without touching existing files
  sync       Refresh managed symlinks, backing up conflicting files first
  codespaces Run the repo-safe setup path for GitHub Codespaces
  all        Run sync plus the bootstrap helpers

EOF
}

case "${1:-}" in
	backup)
		backup
		;;
	link)
		link_dotfiles link
		;;
	sync)
		link_dotfiles sync
		;;
	git)
		setup_git
		;;
	homebrew)
		setup_homebrew
		;;
	shell)
		setup_shell
		;;
	terminfo)
		setup_terminfo
		;;
	macos)
		setup_macos
		;;
	vim)
		setup_vim
		;;
	tmux)
		setup_tmux
		;;
	node)
		setup_node
		;;
	codespaces)
		run_codespaces
		;;
	all)
		run_all
		;;
	help|-h|--help|"")
		usage
		exit 0
		;;
	*)
		usage
		exit 1
		;;
esac

printf "\n"
success "Done."
