-- [ lsp.lua ]
-- Language server config

-- Enable (broadcasting) snippet capability for completion
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("mason").setup()
require("mason-lspconfig").setup()
local lspconfig = require("lspconfig")
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'cssls', 'eslint', 'html', 'jsonls', 'tsserver', 'pyright', 'vimls',  }
for _, lsp in pairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
  }
end
-- special setup for lua to fix up some nonsense
lspconfig.sumneko_lua.setup{
  capabilities = capabilities,
  -- clear the workspace dir when it is in ~/ to prevent errors 
  root_dir = function(fname)
    local path = lspconfig.util.find_git_ancestor(fname)
    if path == os.getenv( "HOME" ) then
      path = nil
    end
    return path
  end,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
