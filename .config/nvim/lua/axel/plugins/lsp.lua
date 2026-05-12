

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client then
      client.server_capabilities.semanticTokensProvider = nil
    end
  end,
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      }
    }
  }
})



vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  {
    border = "single", -- Options: "single", "double", "rounded", "solid", "shadow", "none"
  }
)

vim.keymap.set("n", "gi",         vim.lsp.buf.definition)
vim.keymap.set("n", "gd",         vim.lsp.buf.implementation)
vim.keymap.set("n", "gI",         "<C-o><CR>")
vim.keymap.set("n", "K",          vim.lsp.buf.hover)
vim.keymap.set("n", "e",          vim.diagnostic.open_float)
vim.keymap.set("n", "<F2>",       vim.lsp.buf.rename)
vim.keymap.set("i", "<F2>",       vim.lsp.buf.rename)
