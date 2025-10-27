
vim.lsp.config('*', {
     on_attach = function(client, bufnr)
        local opts = {buffer = bufnr, noremap = true, silent = true}
        vim.keymap.set("n", "gi",          function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "gd",          function() vim.lsp.buf.implementation() end, opts)
        vim.keymap.set("n", "gD",          function() vim.lsp.buf.declaration() end, opts)
        vim.keymap.set("n", "gI",          "<C-o><CR>")
        vim.keymap.set("n", "gh",          function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "gt",          function() vim.lsp.buf.type_definition() end, opts)
        vim.keymap.set("n", "gr",          function() vim.lsp.buf.references() end, opts)

        vim.keymap.set("n", ".f",          function() vim.lsp.buf.formatting() end, opts)
        vim.keymap.set("n", "<C-Space>",   function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("i", "<C-Space>",   function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<F2>",        function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<F2>",        function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("n", "<leader>bh",  function() vim.lsp.buf.signature_help() end, opts)

        vim.keymap.set("n", "<leader>d",   function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>dn",  function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "<leader>dp",  function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "e",           function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "en",          function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "ep",          function() vim.diagnostic.goto_prev() end, opts)
    end
})

vim.lsp.enable('lua_ls')
vim.lsp.enable('pyright')
vim.lsp.enable('clangd')


vim.lsp.config('lua_ls', {
      settings = {
            Lua = {
                  diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = {'vim'},
            }
        }
    }
})


