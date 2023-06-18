local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = ','


return require('lazy').setup({
	-- Colors
	'glepnir/zephyr-nvim',
	'fenetikm/falcon',
	'folke/tokyonight.nvim',

	-- Language Support
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate'
	},

	-- Utilities
	'prettier/vim-prettier',
	'tpope/vim-commentary',
	'tpope/vim-dispatch',
	'tpope/vim-eunuch',
	'tpope/vim-fugitive',
	'tpope/vim-obsession',
	'tpope/vim-repeat',
	'tpope/vim-rhubarb',
	'tpope/vim-sensible',
	'tpope/vim-surround',
	'tpope/vim-vinegar',
	'github/copilot.vim',

	-- LSP
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{                                      -- Optional
			'williamboman/mason.nvim',
			build = function()
				pcall(vim.cmd, 'MasonUpdate')
			end,
		},
		{'williamboman/mason-lspconfig.nvim'}, -- Optional

		-- Autocompletion
		{'hrsh7th/nvim-cmp'},     -- Required
		{'hrsh7th/cmp-nvim-lsp'}, -- Required
		{'L3MON4D3/LuaSnip'},     -- Required
	},},

	-- Interface
	'nvim-lualine/lualine.nvim',
	'nvim-lua/plenary.nvim',
	'nvim-telescope/telescope.nvim',
	'nvim-telescope/telescope-file-browser.nvim',
	'folke/zen-mode.nvim',
	{
		'folke/trouble.nvim',
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require('trouble').setup {
				-- your configuration comes here
				-- or leave it empty to the default settings
				-- refer to the configuration section below
			}
		end
	}

})
