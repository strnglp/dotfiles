-- IMPORTS
require('plug')         -- Plugins
require('vars')         -- Variables
require('opts')         -- Options
require('keys')         -- Keymaps

-- not sure how to do this in lua yet
vim.cmd([[
set termguicolors
set spell spelllang=en_us

set background=dark
colorscheme pencil
hi Normal guibg=NONE ctermbg=NONE

"hi Cursor gui=reverse guibg=NONE guifg=NONE
"hi CursorLine gui=reverse

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif
]])
