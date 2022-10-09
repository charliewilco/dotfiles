vim.g.mapleader = ","

local opt = vim.opt

opt.number = true
opt.lazyredraw = true
opt.relativenumber = true
opt.cursorline = true
opt.showcmd = true
opt.showmatch = true
opt.ruler = true

-- Search

opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- Window Splits

opt.splitright = true
opt.splitbelow = true

opt.termguicolors = true


-- Clipboard

opt.clipboard = "unnamedplus"


-- Tabs & Spaces
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.showtabline = 2
opt.laststatus = 2
opt.cc = ""
opt.smartindent = true
opt.foldmethod = "manual"

opt.backup = false
opt.writebackup = false

opt.updatetime = 300

opt.signcolumn = "yes"
