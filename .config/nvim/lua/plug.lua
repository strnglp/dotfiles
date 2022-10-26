-- [[ plug.lua ]]
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- plugin manager

	-- [[ LSP config -- Order matters ]]
	use({
		"williamboman/mason.nvim", -- language server package manager
		"williamboman/mason-lspconfig.nvim", -- lspconfig helper
		"neovim/nvim-lspconfig", -- language server configuration
		"hrsh7th/nvim-cmp", -- autocompletion plugin
		"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
		"saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
		"L3MON4D3/LuaSnip", -- snippets plugin
		"onsails/lspkind.nvim", -- pictograms for autocompletion list
	})
	require("mason").setup()
	require("mason-lspconfig").setup()
	----------------------------------

	-- general purpose language server, primarily for prettier
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = "nvim-lua/plenary.nvim",
		require("null-ls").setup({
			sources = {
				require("null-ls").builtins.formatting.stylua,
				require("null-ls").builtins.completion.spell,
			},
			on_attach = function(client, bufnr)
				if client.server_capabilities.documentFormattingProvider then
					-- format on save
					vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.format({ async = true })")
				end
			end,
		}),
	})

	use("MunifTanjim/prettier.nvim")
	require("prettier").setup({
		bin = "prettier", -- or `'prettierd'` (v0.22+)
		filetypes = {
			"css",
			"graphql",
			"html",
			"javascript",
			"javascriptreact",
			"json",
			"less",
			"markdown",
			"scss",
			"typescript",
			"typescriptreact",
			"yaml",
		},
	})

	-- better highlighting
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	use("mhinz/vim-startify") -- start page
	use("junegunn/goyo.vim") -- distraction free writing
	use("wuelnerdotexe/vim-astro") -- blog dev
	-- live preview markdown in browser
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	-- fuzzy find
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = "nvim-lua/plenary.nvim",
	})

	-- file tree
	use({
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup()
		end,
		requires = "kyazdani42/nvim-web-devicons",
	})

	-- hex/css coloring
	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ "*" })
		end,
	})

	-- status line
	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = { theme = "auto" },
				--options = { theme = 'PaperColor' }
			})
		end,
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- git integration
	use("dinhhuy258/git.nvim")
	require("git").setup()
	-- git status gutter
	use("lewis6991/gitsigns.nvim")

	-- autopairs
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({ map_cr = true })
		end,
	})
	use({
		"folke/lsp-trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function() require("trouble").setup() end,
	})

	-- [[ Themes ]]
	use("Th3Whit3Wolf/one-nvim")
	use("NLKNguyen/papercolor-theme")
	use("preservim/vim-colors-pencil")
end)

-- [[ REMEMBER TO RUN PackerCompile AFTER CHANGES ]]
