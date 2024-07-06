local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  vim.keymap.set("n", "gi", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "gd", function() vim.lsp.buf.implementation() end, opts)
  vim.keymap.set("n", "gI", "<C-o><CR>")
  vim.keymap.set("n", "<C-SPACE>", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", ",d", function() vim.lsp.buf.type_definition() end, opts)
  vim.keymap.set("n", ".f", function() vim.lsp.buf.formatting() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "<leader>dn", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "<leader>dp", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
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
require('lspconfig').gopls.setup({})


lsp_zero.setup()


