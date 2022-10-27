-- [[ plug.lua ]]
-- bootstrap.lua ensures packer is installed, must be called ahead of this
  return require("packer").startup(function(use)
  use "wbthomason/packer.nvim" -- plugin manager

  -- [[ LSP config Start -- Order matters ]]
  use "williamboman/mason.nvim" -- language server package manager
  use "williamboman/mason-lspconfig.nvim" -- lspconfig helper
  use "neovim/nvim-lspconfig" -- language server configuration
  -- [[ LSP config End -- extensive setup called by lsp.lua ]]

  -- [[ Snippet config Start ]]
  use "hrsh7th/cmp-nvim-lsp" -- LSP source for nvim-cmp
  use "hrsh7th/cmp-buffer"
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use "hrsh7th/nvim-cmp" -- autocompletion plugin
  use "L3MON4D3/LuaSnip" -- snippets plugin
  use "saadparwaiz1/cmp_luasnip" -- Snippets source for nvim-cmp
  use "onsails/lspkind.nvim" -- pictograms for autocompletion list
  -- [[ Snippet config End -- extensive setup called in snippet.lua ]]

  -- error / warning details
  use {
    "folke/lsp-trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }
  require("trouble").setup()

  -- general purpose language server, primarily for prettier
  use {
    "jose-elias-alvarez/null-ls.nvim",
    requires = "nvim-lua/plenary.nvim",
  }
  require("null-ls").setup {
    sources = {
      require("null-ls").builtins.completion.luasnip
    }
  }

  -- fuzzy find
  use {
    "nvim-telescope/telescope.nvim",
    branch = '0.1.x',
    requires = "nvim-lua/plenary.nvim",
  }

  -- file tree
  use {
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
  }
  require("nvim-tree").setup()

  use "norcalli/nvim-colorizer.lua" -- hex/css coloring
  use "dinhhuy258/git.nvim" -- git integration
  use "lewis6991/gitsigns.nvim" -- git status gutter
  use "windwp/nvim-autopairs" -- autopairs
  use "nvim-treesitter/nvim-treesitter" -- better highlighting
  use "mhinz/vim-startify" -- start page

  -- [[ Themes ]]
  use("Th3Whit3Wolf/one-nvim")
  use("NLKNguyen/papercolor-theme")
  use("preservim/vim-colors-pencil")

  -- status line
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
        config = function() require('lualine').setup {
      options = { theme = 'auto' }
    } end,
  }

end)

-- [[ REMEMBER TO RUN PackerCompile AFTER CHANGES ]]
