vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Colors

	use 'glepnir/zephyr-nvim'
	use 'fenetikm/falcon'
	use 'folke/tokyonight.nvim'

	-- Language Support

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	-- Utilities

	use 'prettier/vim-prettier'
	use 'tpope/vim-commentary'
	use 'tpope/vim-dispatch'
	use 'tpope/vim-eunuch'
	use 'tpope/vim-fugitive'
	use 'tpope/vim-obsession'
	use 'tpope/vim-repeat'
	use 'tpope/vim-rhubarb'
	use 'tpope/vim-sensible'
	use 'tpope/vim-surround'
	use 'tpope/vim-vinegar'
	use 'github/copilot.vim'

	-- LSP

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},         -- Required
			{'hrsh7th/cmp-nvim-lsp'},     -- Required
			{'hrsh7th/cmp-buffer'},       -- Optional
			{'hrsh7th/cmp-path'},         -- Optional
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
			{'hrsh7th/cmp-nvim-lua'},     -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip'},             -- Required
			{'rafamadriz/friendly-snippets'}, -- Optional
		}
	}

	-- Interface

	use 'nvim-lualine/lualine.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-telescope/telescope-file-browser.nvim'
	use 'folke/zen-mode.nvim'
	use {
		'folke/trouble.nvim',
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require('trouble').setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}

end)
