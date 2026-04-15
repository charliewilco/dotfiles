# Dotfiles

Install [Xcode](https://developer.apple.com/xcode/) first and open it once, or run `xcode-select --install`.

This repo is tuned for my machine. If you're not me, copy the parts you want instead of applying it wholesale.

## Setup

Clone the repo locally and run the bootstrap from the checkout:

```sh
git clone https://github.com/charliewilco/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./setup.sh
```

`setup.sh` is a thin wrapper around `./init.sh all`.

## Codespaces

For GitHub Codespaces, use the lighter path:

```sh
./init.sh codespaces
```

That mode intentionally skips the host-level steps that do not make sense in a containerized dev environment:

- Homebrew installation
- shell changes via `chsh`
- interactive git identity prompts
- macOS defaults

It still refreshes managed links and runs repo-local setup for terminfo, Neovim, tmux, and global npm tools when those commands are available in the Codespace.

## Syncing

The ongoing maintenance path is explicit now:

```sh
./init.sh link
./init.sh sync
./init.sh backup
```

- `link` only creates missing symlinks.
- `sync` refreshes managed symlinks and moves conflicting files into `~/dotfiles-backup/<timestamp>`.
- `backup` only backs up managed targets without relinking.

Managed top-level dotfiles come from `*.symlink`, and top-level entries in `config/` are linked into `~/.config/`.

## Bootstrap Commands

`./init.sh all` runs the full bootstrap flow:

- sync dotfile symlinks
- install terminfo entries
- install Brewfile dependencies
- set the default shell
- configure git
- apply macOS defaults
- sync Neovim plugins
- install tmux plugins
- install global npm packages from `node/deps`

For backwards compatibility, `./install.sh` and `./setup.sh` both delegate to `./init.sh`.

## Cheatsheet

There's a [cheatsheet](https://github.com/charliewilco/dotfiles/blob/master/cheatsheet.md) for very common things I do with Vim and command line utilities (ie `ag`, `hub`, and more to come).

## SSH

You need to create a file for SSH `~/.ssh/config` with the following contents:

```sh
Host *
    UseKeychain yes
```

It solves a lot of issues with macOS and SSH.

## tmux colors + _Italics_

There are two files here with the `.terminfo` extension, do the following with them:

```shell
tic -x xterm-256color-italic.terminfo
tic -x tmux-256color.terminfo
```

```vim
if has('termguicolors')
	" Don't need this in xterm-256color, but do need it inside tmux.
	" (See `:h xterm-true-color`.)
	if &term =~# 'tmux-256color'
		let &t_8f="\e[38;2;%ld;%ld;%ldm"
		let &t_8b="\e[48;2;%ld;%ld;%ldm"
	endif
endif
```

```tmux
set -g default-terminal 'tmux-256color'
set -as terminal-overrides ',xterm*:Tc:sitm=\E[3m'
```

## Other Dotfiles

This is the list of dotfiles I've looked through and learned something cool from:

- [Zach Holman](https://github.com/holman/dotfiles)
- [Thoughtbot](https://github.com/thoughtbot/dotfiles)
- [Mike Hartington](https://github.com/mhartington/dotfiles)
- [Colby Williams](https://github.com/colbycheeze/dotfiles)
- [Dan Eden](https://github.com/daneden/dotfiles)
- [Cole Peters](https://github.com/colepeters/dotfiles)
- [Helen Holmes](https://github.com/helenvholmes/dotfiles)

## Contributing

First off, you're awesome for wanting to contribute. Second, please take a second to go over a few things to make this process simpler for everyone. Third, you're awesome.

### Pull Requests

- [Fork](https://github.com/charliewilco/dotfiles#fork-destination-box) this repo.
- Push to your fork and submit a pull request.
- Please provide a short explanation of why you made the changes you made.

## License

The Unlicense
