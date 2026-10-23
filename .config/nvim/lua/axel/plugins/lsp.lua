

-- kotlin-lsp sometimes sends client/(un)registerCapability without the
-- registrations array, which crashes Neovim 0.12-dev's handler
-- (bad argument #1 to 'ipairs'). Default the arrays to {} before delegating.
local orig_register = vim.lsp.handlers["client/registerCapability"]
vim.lsp.handlers["client/registerCapability"] = function(err, params, ctx)
  params = params or {}
  params.registrations = params.registrations or {}
  return orig_register(err, params, ctx)
end

local orig_unregister = vim.lsp.handlers["client/unregisterCapability"]
vim.lsp.handlers["client/unregisterCapability"] = function(err, params, ctx)
  params = params or {}
  params.unregisterations = params.unregisterations or {}
  return orig_unregister(err, params, ctx)
end

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



vim.keymap.set("n", "gi",         vim.lsp.buf.definition)
vim.keymap.set("n", "gd",         vim.lsp.buf.implementation)
vim.keymap.set("n", "gI",         "<C-o><CR>")
vim.keymap.set("n", "K",          function() vim.lsp.buf.hover({ border = "single" }) end)
vim.keymap.set("n", "e",          vim.diagnostic.open_float)
vim.keymap.set("n", "<F2>",       vim.lsp.buf.rename)
vim.keymap.set("i", "<F2>",       vim.lsp.buf.rename)

-- IntelliJ-style quick fix / context actions
vim.keymap.set("n", "<A-CR>",     vim.lsp.buf.code_action)
vim.keymap.set("x", "<A-CR>",     vim.lsp.buf.code_action)
