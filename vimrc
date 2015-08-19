set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'mattn/emmet-vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'chriskempson/base16-vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'Townk/vim-autoclose'
Plugin 'bling/vim-airline'
Plugin 'evidens/vim-twig'
Plugin 'wavded/vim-stylus'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'StanAngeloff/php.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'walm/jshint.vim'
Plugin 'junegunn/fzf'
Plugin 'hail2u/vim-css3-syntax'

call vundle#end()

Bundle "wookiehangover/jshint.vim"

set number
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
syntax enable
set background=dark
colorscheme base16-default
set t_Co=256

so ~/.vim/bundle/vim-colors-solarized/autoload/togglebg.vim
set laststatus=2

call togglebg#map("<F5>")

if has('gui_running')
  set guifont=Input\ Mono:h13
  set transparency=5
endif


imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

let g:jsx_ext_required = 0

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_theme='solarized'
