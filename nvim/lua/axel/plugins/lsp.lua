local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('lspconfig').lua_ls.setup({})
require('lspconfig').pyright.setup({})
require('lspconfig').clangd.setup({})
require('lspconfig').tsserver.setup({})
require('lspconfig').rust_analyzer.setup({})
require('lspconfig').marksman.setup({})
