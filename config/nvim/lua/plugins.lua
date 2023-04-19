vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Colors

	use 'glepnir/zephyr-nvim'
	use 'fenetikm/falcon'
	use 'folke/tokyonight.nvim'
	use 'f-person/auto-dark-mode.nvim'

	-- Language Support

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	-- Utilities

	use 'prettier/vim-prettier'
	use 'junegunn/goyo.vim'
	use 'junegunn/vim-emoji'
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
		branch = 'v1.x',
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
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional
		},
	}

	use {
		'glepnir/dashboard-nvim',
		event = 'VimEnter',
		requires = {'nvim-tree/nvim-web-devicons'},
		config = function() 
			require('dashboard').setup({
				theme = 'hyper',
				config = {
					week_header = {
						enable = true
					},
					shortcut = {
						{ desc = ' Update', group = '@property', action = 'Lazy update', key = 'u' },
						{
							icon = ' ',
							icon_hl = '@variable',
							desc = 'Files',
							group = 'Label',
							action = 'Telescope find_files',
							key = 'f',
						},
						{
							desc = ' Apps',
							group = 'DiagnosticHint',
							action = 'Telescope app',
							key = 'a',
						},
						{
							desc = ' dotfiles',
							group = 'Number',
							action = 'Telescope dotfiles',
							key = 'd',
						},
					},
				},

			})
		end
	}

	end)
