local opt = vim.opt

opt.number = true
opt.lazyredraw = true
opt.relativenumber = true
opt.cursorline = true
opt.showcmd = true
opt.showmatch = true
opt.ruler = true

opt.list = true
opt.listchars= {
	tab = '→ '
}

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

opt.clipboard = 'unnamedplus'


-- Tabs & Spaces
opt.smartindent = true
opt.expandtab = false
opt.tabstop = 4
opt.shiftwidth = 4
opt.showtabline = 2
opt.laststatus = 2
opt.cc = ''
opt.foldmethod = 'manual'

opt.backup = false
opt.writebackup = false

opt.updatetime = 300

opt.signcolumn = 'yes'
