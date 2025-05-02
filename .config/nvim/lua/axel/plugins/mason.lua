--'lua_ls', 
--'tsserver',
--'rust_analyzer',
--"clangd",
--"marksman",
--"pyright",


require("mason").setup({
    ui = {
        icons = {
            package_installed = "✅",
            package_pending = "☑️",
            package_uninstalled = "❌"
        }
    }
})
