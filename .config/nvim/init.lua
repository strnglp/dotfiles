local status, bootstrap = pcall(require, "bootstrap")
if not status then
  return
end
-- Must have packer to install and configure the rest of the config
bootstrap.bootstrap()
require("opts")    -- 1. NeoVim Options
require("keys")    -- 2. Keymaps
require("plug")    -- 3. Plugins
require("lsp")     -- 4. LSP(plugin config)
require("snippet") -- 5. Snippets

vim.cmd([[ 
colorscheme pencil 
set background=light
hi Normal guibg=NONE ctermbg=NONE

let g:loaded_perl_provider = 0
]])
