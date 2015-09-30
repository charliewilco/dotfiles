set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Colors
Plugin 'altercation/vim-colors-solarized'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'chriskempson/base16-vim'
Plugin 'whatyouhide/vim-gotham'
Plugin 'yosiat/oceanic-next-vim'

" Syntax Checkers
Plugin 'scrooloose/syntastic'
Plugin 'pangloss/vim-javascript'
Plugin 'evidens/vim-twig'
Plugin 'othree/html5.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'StanAngeloff/php.vim'
Plugin 'mxw/vim-jsx'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'digitaltoad/vim-jade'
Plugin 'JulesWang/css.vim'

" Utilities
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rking/ag.vim'
Plugin 'mattn/emmet-vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'spf13/vim-autoclose'
Plugin 'bling/vim-airline'
Plugin 'editorconfig/editorconfig-vim'

Plugin 'walm/jshint.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set number
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
syntax enable
set background=dark
let g:hybrid_use_Xresources = 1
" colorscheme hybrid_material
" colorscheme hybrid_reverse
" colorscheme base16-eighties
set t_Co=256
if has('gui_running')
  colorscheme gotham
  let g:airline_theme='gotham'
else
  colorscheme gotham256
  let g:airline_theme='gotham256'
endif

so ~/.vim/bundle/vim-colors-solarized/autoload/togglebg.vim
set laststatus=2

call togglebg#map("<F5>")

if has('gui_running')
  set guifont=Input\ Mono:h13
  set transparency=5
endif


imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

let g:jsx_ext_required = 0
let g:enable_bold_font = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
" let g:airline_theme='hybrid'
