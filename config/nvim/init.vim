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
Plug 'glepnir/zephyr-nvim'
Plug 'fenetikm/falcon'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'projekt0n/github-nvim-theme'

"" Language Support
Plug 'othree/html5.vim'
Plug 'JulesWang/css.vim'
Plug 'plasticboy/vim-markdown'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'neoclide/vim-jsx-improve'
Plug 'sheerun/vim-json'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'jparise/vim-graphql'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'pantharshit00/vim-prisma'

" Utilities
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
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
"
" Interface
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'

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

set t_Co=256

if has('termguicolors')
	set termguicolors
endif

set background=dark

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


lua << END
require('telescope').setup {
  extensions = {
    file_browser = {
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
    },
  },
}
require('github-theme').setup {
  theme_style = 'dark_default',
  function_style = 'italic',
  sidebars = {'qf', 'vista_kind', 'terminal', 'packer'},

  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  colors = {hint = 'orange', error = '#ff0000'},
}

 ---[[ Lualine
require('lualine').setup {
  options = {
    theme = 'auto',
    section_separators = '',
    component_separators = ''
  },
  tabline = {
    lualine_a = {'buffers'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding'},
    lualine_y = {'progress'},
    lualine_z = {'tabs'}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'FugitiveHead', 'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  }
}

vim.g.goyo_width = 95
vim.cmd[[colorscheme tokyonight]]
END

" SearchTasks
let g:searchtasks_list=["TODO", "FIXME", "NOTE"]

" CoC.nvim
let g:coc_global_extensions = [
  \ 'coc-yank',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-json', 
  \ 'coc-git',
  \ 'coc-yaml'
  \ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/jest')
  let g:coc_global_extensions += ['coc-jest']
endif


" Prettier
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

" TypeScript
let g:tscompletejob_node_cmd = "/usr/local/bin/node"

autocmd FileType typescript setlocal completeopt+=menu
autocmd FileType typescript.tsx setlocal completeopt+=menu

" Markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1


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


" Leader

let mapleader = ","

nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
inoremap <leader>j <Esc>:m .+1<CR>==gi
inoremap <leader>k <Esc>:m .-2<CR>==gi
vnoremap <leader>j :m '>+1<CR>gv=gv
vnoremap <leader>k :m '<-2<CR>gv=gv


" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" CoC.nvim
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

