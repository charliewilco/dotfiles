vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Colors
  use 'glepnir/zephyr-nvim'
  use 'fenetikm/falcon'
  use 'projekt0n/github-nvim-theme'
  use 'f-person/auto-dark-mode.nvim'

  -- Language Support
  use 'othree/html5.vim'
  use 'JulesWang/css.vim'
  use 'preservim/vim-markdown'
  use 'pangloss/vim-javascript'
  use 'MaxMEllon/vim-jsx-pretty'
  use 'sheerun/vim-json'
  use 'jparise/vim-graphql'
  use 'leafgarland/typescript-vim'
  use 'cespare/vim-toml'
  use 'rust-lang/rust.vim'
  use 'pantharshit00/vim-prisma'

  -- Utilities
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
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'

  -- Interface
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

end)
