-- This file contains my plugins for Neovim
return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Tokyo Night theme
  use 'folke/tokyonight.nvim'

  -- File Explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons'
    },
    config = function() require 'nvim-tree'.setup {} end
  }

  -- Status Line
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons'
    },
    config = function() require 'lualine'.setup {} end
  }

  -- TreeSitter for Syntax Highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require 'nvim-treesitter.configs'.setup {
      highlight = {enable = true, additional_vim_regex_highlighting = true},
      ensure_installed = {"cpp", "java"}
    }
    end
  }

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    config = function() require 'plugins.nvim-lspconfig' end
  }

  -- Autocomplete
  use {
    'hrsh7th/nvim-cmp',
    config = function() require 'plugins.nvim-cmp' end,
    requires = {
      'hrsh7th/cmp-buffer', 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-path',
      'quangnguyen30192/cmp-nvim-ultisnips', 'hrsh7th/cmp-cmdline'
    }
  }

  -- Autopair
  use {
    'windwp/nvim-autopairs',
    config = function() require 'nvim-autopairs'.setup {} end
  }

  -- -- UltiSnips
  use 'SirVer/ultisnips'

  -- LaTeX Plugins
  use 'lervag/vimtex'

  -- Faster commenting
  use 'tpope/vim-commentary'

  -- Fuzzy finder
  use {
    'junegunn/fzf.vim',
    requires = {
      'junegunn/fzf'
    }
  }
end) 
