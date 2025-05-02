local cw = require('cmdwin')

local function from_keymap(keymap)
    return "lua vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("
        .. keymap
        .. ", true, true, true), 'n', true)"
end

cw.setup({
    keymap = '<C-p>',
    command_map = {
        ["Format"] = "lua vim.lsp.buf.format()",
        ["Find File"] = "Telescope find_files",
        ["Equal Buff"] = from_keymap("<C-w>="),
        ["Spell Suggestions"] = from_keymap("z="),
        ["Go to implementation"] = "lua vim.lsp.buf.implementation()",
        ["Go to declaration"] = "lua vim.lsp.buf.declaration()",
        ["Harpoon clear all"] = 'lua require("harpoon.mark").clear_all()',
        ["Harpoon add file"] = 'lua require("harpoon.mark").add_file()',
    },
    navigation = {
        up = '<C-p>',
        down = '<C-n>',
    },
    style = {
        prompt = "🔎  ",
        separator = " ",
        selected = "👉",
        unselected = "  ",
    },
    window = {
        position = 'top', -- 'center', 'top', 'bottom', 'left', 'right'
        width = 40,       -- custom width
        height = 15,      -- custom height
        padding = {
            top = 1,      -- padding from top of screen
            right = 0,    -- padding from right of screen
            bottom = 0,   -- padding from bottom of screen
            left = 0,     -- padding from left of screen
        },
        border = 'single' -- border style ('none', 'single', 'double', 'rounded', 'solid', 'shadow')
    },
})
