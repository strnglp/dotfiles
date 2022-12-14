--[[ opts.lua ]]
local opt = vim.opt

-- [[ Theme ]]
opt.syntax = 'on'
opt.background='dark'
opt.termguicolors= true

-- mouse in all modes
opt.mouse='a'
-- yank to clipboard and primary selection (mouse 3)
opt.clipboard:prepend {'unnamed', 'unnamedplus'}

-- file handling
opt.modelines = 0
opt.encoding = 'utf-8'
opt.formatoptions = 'qrn1'

-- pane 
opt.hidden = true
opt.mousehide = true
opt.lazyredraw = true
opt.visualbell = true

-- tabs 
opt.tabstop= 2
opt.shiftwidth= 2
opt.softtabstop= 2
opt.expandtab = true
opt.autoindent = true

-- scrolling and gutter
opt.wrap = true
opt.scrolloff = 3
opt.laststatus = 2
opt.textwidth = 79
opt.relativenumber = true
opt.number = true

-- status line
opt.ruler = true
opt.showcmd = true
opt.showmode = true
opt.cursorline = true

-- menu
opt.wildmenu = true
opt.wildmode = 'list:longest'

-- undo and swap files
opt.undofile = true
opt.directory= '/tmp'

-- search
opt.hlsearch = true
opt.smartcase = true
opt.incsearch = true
opt.showmatch = true
opt.ignorecase = true

-- for autocompletion snippets
opt.completeopt = {'menu', 'menuone', 'noselect'}

-- make gutter use signs instead of letters
local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

