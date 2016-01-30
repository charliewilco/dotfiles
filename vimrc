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
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'johnoshea/vim-twig'

"" CSS
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'JulesWang/css.vim'
Plugin 'stephenway/postcss.vim'

"" Javascript
Plugin 'mxw/vim-jsx'
Plugin 'othree/yajs.vim'
Plugin 'pangloss/vim-javascript'

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
Plugin 'Valloric/YouCompleteMe'
Plugin 'ternjs/tern_for_vim'

call vundle#end()            " required
filetype plugin indent on    " required


"==============================
" Configuration
"==============================

" Default Settings

syntax enable

set shell=$SHELL
set number
set numberwidth=5
set relativenumber
set smartindent
set cursorline
set showcmd

" Tabs & Spaces

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set background=dark
set laststatus=2

" Colors Themes & Font Settings

colorscheme OceanicNext
set t_Co=256
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Highlights

highlight SignColumn ctermfg=DarkBlue ctermbg=black
highlight SignColumnNR ctermbg=black
highlight LineNr ctermfg=DarkBlue ctermbg=black
highlight CursorLineNR ctermbg=black ctermfg=red cterm=bold
highlight CursorLine ctermbg=NONE cterm=NONE


" Clipboard

set clipboard=unnamed
set clipboard+=unnamedplus

" For MacVim

if has('gui_running')
  set guifont=Input\ Mono:h14
endif

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
highlight GitGutterAdd ctermbg=black ctermfg=green
highlight GitGutterChange ctermbg=black ctermfg=yellow
highlight GitGutterDelete ctermbg=black ctermfg=red
highlight GitGutterChangeDelete ctermbg=black ctermfg=yellow

" YouCompleteMe
let g:ycm_show_diagnostics_ui = 0
let g:python_host_prog = '/usr/local/bin/python'

" Ctrl-P Ignore

set wildignore+=*/node_modules/*,*/tmp/*,*.so,*.swp,*.zip

" Syntastic Checkers
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_jscs_exec='/usr/local/bin/jscs'
let g:syntastic_eslint_exec='/usr/local/bin/eslint'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_html_checkers = ['handlebars']
let g:syntastic_css_checkers = ['stylelint']
let g:syntastic_javascript_checkers = ['jscs', 'eslint']

let g:syntastic_enable_js_checkers = 1


" Not Sure

let g:jsx_ext_required = 0
let g:enable_bold_font = 1


"==============================
" File Types
"==============================

autocmd BufNewFile,BufRead *.css set filetype=postcss
autocmd BufNewFile,BufRead *.hbs set filetype=mustache
autocmd BufNewFile,BufRead *.md  set filetype=markdown
autocmd BufNewFile,BufRead *.jsx set filetype=jsx
autocmd BufNewFile,BufRead *.js  set filetype=javascript

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
