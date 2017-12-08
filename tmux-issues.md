# tmux colors and italics


1. Go grab the terminfo files from [ wincent ](https://github.com/wincent/wincent/tree/master/roles/terminfo:w)
2. run tic on all of them, in and out of tmux
3. things work

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
set -g default-terminal "tmux-256color"
set -ga terminal-overrides ',xterm-256color:Tc'
```
