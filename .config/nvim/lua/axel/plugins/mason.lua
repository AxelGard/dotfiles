

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✅",
            package_pending = "☑️",
            package_uninstalled = "❌"
        }
    }
})

-- Setup mason-lspconfig
require("mason-lspconfig").setup({
  automatic_installation = true, -- optional: auto-install missing servers
  automatic_enable = true,
})



