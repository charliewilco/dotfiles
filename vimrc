set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Colors
Plugin 'trusktr/seti.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'mhartington/oceanic-next'

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
Plugin 'stephenway/postcss.vim'

" Utilities
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rking/ag.vim'
Plugin 'mattn/emmet-vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'spf13/vim-autoclose'
Plugin 'bling/vim-airline'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'walm/jshint.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

call gitgutter#highlight#define_highlights()

" Default Settings

syntax enable

set number
set relativenumber
set smartindent
set cursorline
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set background=dark


" let g:hybrid_use_Xresources = 1
colorscheme OceanicNext 
set t_Co=256
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:airline_theme='oceanicnext'
hi CursorLineNr term=bold ctermfg=White guifg=White


so ~/.vim/bundle/vim-colors-solarized/autoload/togglebg.vim
set laststatus=2

call togglebg#map("<F5>")

if has('gui_running')
  set guifont=Input\ Mono:h12
  " set transparency=5
endif

" Save Command
nnoremap <c-s> :w<CR> 
inoremap <c-s> <Esc>:w<CR>l 
vnoremap <c-s> <Esc>:w<CR>

imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Ctrl-P Ignore
set wildignore+=*/node_modules/*,*/tmp/*,*.so,*.swp,*.zip

" Syntax Checkers
let g:syntastic_html_checkers = ['handlebars']
let g:syntastic_css_checkers = ['csslint', 'stylelint']
let g:syntastic_js_checkers = ['jscs', 'eslint', 'jshint']

let g:jsx_ext_required = 0
let g:enable_bold_font = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1

" No Remap for Arrow Keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>


