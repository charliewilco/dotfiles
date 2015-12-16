"==============================
"
" 
" Vim & NeoVim Runtime Configuration
"
"
"==============================

" The following settings are for Vim not Neovim
set nocompatible              " be iMproved, required
filetype off                  " required

"==============================
" Plugins
"==============================

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle manages Vundle, required
Plugin 'gmarik/Vundle.vim'

" Colors
Plugin 'mhartington/oceanic-next'
Plugin 'kristijanhusak/vim-hybrid-material'

" Syntax Checkers
Plugin 'scrooloose/syntastic'

"" HTML 
Plugin 'othree/html5.vim'

"" CSS
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'JulesWang/css.vim'
Plugin 'stephenway/postcss.vim'

"" Javascript
Plugin 'mxw/vim-jsx'
Plugin 'othree/yajs.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mustache/vim-mustache-handlebars'

" Utilities
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'rking/ag.vim'
Plugin 'mattn/emmet-vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'spf13/vim-autoclose'
Plugin 'bling/vim-airline'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tomtom/tcomment_vim'

call vundle#end()            " required
filetype plugin indent on    " required


"==============================
" Configuration
"==============================

" Default Settings

syntax enable

set number
set relativenumber
set smartindent
set cursorline

" Tabs & Spaces

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set background=dark
set laststatus=2

" Colors Themes & Font Settings

colorscheme OceanicNext 
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

"" For MacVim

if has('gui_running')
  set guifont=Input\ Mono:h14
endif


" Cursor

hi CursorLineNR cterm=bold
" hi CursorLineNr term=bold ctermfg=White guifg=White

"==============================
" Plugin Settings
"==============================

" Airline

let g:airline_theme='oceanicnext'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1


" Gitgutter

call gitgutter#highlight#define_highlights()

" Ctrl-P Ignore

set wildignore+=*/node_modules/*,*/tmp/*,*.so,*.swp,*.zip

" Syntax Checkers

let g:syntastic_html_checkers = ['handlebars']
let g:syntastic_css_checkers = ['csslint', 'stylelint']
let g:syntastic_js_checkers = ['jscs', 'eslint', 'jshint']

" Not Sure

let g:jsx_ext_required = 0
let g:enable_bold_font = 1

"==============================
" Mappings
"==============================

" Leader

" tComment
map <leader>c <c-_><c-_>

" Emmet

imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" No Remap for Arrow Keys

nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
