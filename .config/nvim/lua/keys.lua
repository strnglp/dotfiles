--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap

-- ; for :
map('n', ';', ':', { noremap = true })

-- Toggle nvim-tree
map('', '<F1>', [[:NvimTreeToggle<CR>]], {})

-- regex sanity - this didn't carry over well to neovim, some bug with unicode?
--map('n', '/', '/\v', { noremap = true })
--map('v', '/', '/\v', { noremap = true })

-- clear search with space comma
map('n', '<leader><space>', [[:noh<CR>]], { noremap = true })

-- match pairs
map('n', '<tab>', '%', { noremap = true })
map('v', '<tab>', '%', { noremap = true })

-- enable repaste
map('x', 'p', 'pgvy', { noremap = true })

-- browse buffers with ctrl-j|k
map('n', '<C-j>', [[:bn<CR>]], { noremap = true })
map('n', '<C-k>', [[:bp<CR>]], { noremap = true })

-- close buffer with ctrl-x
map('n', '<C-x>', [[:bd<CR>]], { noremap = true })

-- fuzz find with telescope.vim
map('n', '<leader>f', [[:Telescope find_files<CR>]], { noremap = true })
