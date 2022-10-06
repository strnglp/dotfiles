--[[ opts.lua ]]
local opt = vim.opt
local cmd = vim.api.nvim_command

-- [[ Theme ]]
opt.syntax = 'on'
opt.background='light'

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
