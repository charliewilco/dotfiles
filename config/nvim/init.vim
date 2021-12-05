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

call plug#begin('~/.config/nvim/plugged')


" Colors
Plug 'ayu-theme/ayu-vim'
Plug 'joshdick/onedark.vim'

"" Language Support
Plug 'othree/html5.vim'
Plug 'JulesWang/css.vim'
Plug 'plasticboy/vim-markdown'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'neoclide/vim-jsx-improve'
Plug 'sheerun/vim-json'
Plug 'jparise/vim-graphql'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'cespare/vim-toml'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim'
Plug 'pantharshit00/vim-prisma'

" Utilities
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-emoji'
Plug 'reedes/vim-pencil'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'gilsondev/searchtasks.vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
"
" Interface
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
" Plug 'taohexxx/lightline-buffer'
Plug 'yarisgutierrez/ayu-lightline'
Plug 'mengelbrecht/lightline-bufferline'

call plug#end()            " required
filetype plugin indent on    " required


"==============================
" Configuration
"==============================

" Default Settings

syntax enable

set shell=$SHELL
set encoding=utf-8
set number
set lazyredraw
set background=dark
set relativenumber
set cursorline
set showcmd
set showmatch
set ruler
set mouse=a

" Search Settings

set incsearch
set ignorecase
set smartcase
set nohlsearch

" Window Splits

set splitright
set splitbelow

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Tabs & Spaces

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set laststatus=2
set cc=95
set smartindent
set showtabline=2
set foldmethod=manual

" Colors Themes & Font Settings

colorscheme ayu
let ayucolor="mirage"
set t_Co=256
set background=dark

if has('termguicolors')
	set termguicolors
  " Don't need this in xterm-256color, but do need it inside tmux.
  " (See `:h xterm-true-color`.)
  " if &term =~# 'tmux-256color'
  "   let &t_8f="\e[38;2;%ld;%ld;%ldm"
  "   let &t_8b="\e[48;2;%ld;%ld;%ldm"
  " endif
endif

" hi NonText ctermbg=NONE guibg=NONE
" hi Normal ctermbg=NONE guibg=NONE

" Highlights

highlight StatusLine cterm=italic gui=italic
highlight Comment cterm=italic gui=italic
highlight SpecialComment cterm=italic gui=italic
highlight SignColumn ctermfg=DarkBlue ctermbg=NONE
highlight SignColumnNR ctermbg=black
highlight LineNr ctermfg=DarkGrey ctermbg=NONE
highlight LineNr ctermfg=DarkGrey ctermbg=NONE
highlight CursorLineNR ctermbg=NONE ctermfg=Grey cterm=bold
highlight CursorLine ctermbg=NONE cterm=NONE

" Clipboard

set clipboard=unnamed
set clipboard+=unnamedplus

"==============================
" Plugin Settings
"==============================

" JSX

let g:jsx_ext_required = 1  
let g:jsx_pragma_required = 1

" Lightline
let g:lightline = { 'colorscheme': 'ayu' }

let s:symbol_separator_left     = "\uE0B0"
let s:symbol_separator_right    = "\uE0B2"
let s:symbol_subseparator_left  = "\uE0B1"
let s:symbol_subseparator_right = "\uE0B3"
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
let g:lightline.separator        = {'left': s:symbol_separator_left, 'right': s:symbol_separator_right}
let g:lightline.subseparator     = {'left': s:symbol_subseparator_left, 'right': s:symbol_subseparator_right}


" Goyo

let g:goyo_width = 95

" SearchTasks

let g:searchtasks_list=["TODO", "FIXME", "NOTE"]


" NERDTree
map <C-n> :NERDTreeToggle<CR>

" CoC.nvim
let g:coc_global_extensions = [
  \ 'coc-yank',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-json', 
  \ 'coc-git',
  \ 'coc-yaml',
  \ 'coc-go'
  \ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/jest')
  let g:coc_global_extensions += ['coc-jest']
endif

nnoremap <silent> K :call CocAction('doHover')<CR>
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <F2> <Plug>(coc-rename)


" Run jest for current project
command! -nargs=0 Jest :call  CocAction('runCommand', 'jest.projectTest')

" Run jest for current file
command! -nargs=0 JestCurrent :call  CocAction('runCommand', 'jest.fileTest', ['%'])

" Run jest for current test
nnoremap <leader>te :call CocAction('runCommand', 'jest.singleTest')<CR>

" Init jest in current cwd, require global jest command exists
command! JestInit :call CocAction('runCommand', 'jest.init')
"
" Syntastic Checkers

" Prettier

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.json,*.graphql,*.vue PrettierAsync

" TypeScript
let g:tscompletejob_node_cmd = "/usr/local/bin/node"

autocmd FileType typescript setlocal completeopt+=menu
autocmd FileType typescript.tsx setlocal completeopt+=menu

" Snippets

" Not Sure

let g:enable_italic_font = 1
let g:enable_bold_font = 1

" Markdown

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_fenced_languages = ['html', 'css', 'ts=typescript', 'js=javascript.jsx']


"==============================
" GUI Vim Settings
"==============================

" For NeoVim

let g:python3_host_prog = '/usr/local/bin/python3'
let g:loaded_python_provider = 1

" Remaps Esc to leave Terminal mode
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif


" MacVim
if has('gui_running')
  set background=dark

  if (has("termguicolors"))
    set termguicolors
  endif

  highlight StatusLine cterm=italic gui=italic
  highlight Comment cterm=italic gui=italic
  highlight SpecialComment cterm=italic gui=italic
endif

if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif

"==============================
" File Types
"==============================

autocmd BufNewFile,BufRead *.hbs set filetype=mustache.html
autocmd BufNewFile,BufRead *.md  set filetype=markdown
autocmd BufNewFile,BufRead *.js  set filetype=javascript.jsx


"==============================
" Mappings
"==============================

" CoC.nvim


" Leader

let mapleader = ","

nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
inoremap <leader>j <Esc>:m .+1<CR>==gi
inoremap <leader>k <Esc>:m .-2<CR>==gi
vnoremap <leader>j :m '>+1<CR>gv=gv
vnoremap <leader>k :m '<-2<CR>gv=gv

" FZF

nnoremap <C-p> :GFiles<CR>
inoremap <C-p> <ESC>:GFiles<CR>

nnoremap <C-b> :Buffers<CR>
inoremap <C-b> <ESC>:Buffers<CR>

" No Remap for Arrow Keys

inoremap <ScrollWheelUp> <Nop>
inoremap <ScrollWheelDown> <Nop>
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

highlight StatusLine cterm=italic gui=italic
highlight Comment cterm=italic gui=italic
highlight SpecialComment cterm=italic gui=italic

