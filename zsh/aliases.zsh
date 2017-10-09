# Common

alias please='sudo'
alias ls='ls -a'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias dstry='find . -name ".DS_Store" -type f -delete'

alias npmr='trash node_modules; npm cache clean; npm install'
alias ag='ag --path-to-agignore=~/.agignore'
alias r='yarn run'
alias tree='tree -h -I "node_modules*|bower_components*"'
alias cat='ccat'
alias empty='empty-trash'
alias flx='hidden-files'

# Git & Apps

alias tweetbot='open /Applications/Tweetbot.app'
alias g='git'

# Project Directories

export FZF_DEFAULT_OPTS='
  --color=bg+:#022538,bg:#093750,spinner:#F1D677,hl:#A2D9F5
  --color=fg:#DCEBF5,header:#A2D9F5,info:#FFBA00,pointer:#00B7ED
  --color=marker:#00B7ED,fg+:#F5837F,prompt:#00B7ED,hl+:#00B7ED
'

alias dotfiles='cd ~/.dotfiles/'
