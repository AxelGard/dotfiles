local cw = require('cmdwin')

cw.setup({
    keymap = '<C-p>',
    command_map = {
        ["Format"] = "lua vim.lsp.buf.format()",
        ["Git Status"] = "Git",
        ["Find File"] = "Telescope find_files",
    },
    navigation = {
        up = '<C-k>',
        down = '<C-j>',
    },
    style = {
        prompt = "🔎  ",
        separator = " ",
        selected = "> ",
        unselected = "  ",
    },
    window = {
        position = 'top',  -- 'center', 'top', 'bottom', 'left', 'right'
        width = 40,        -- custom width
        height = 15,       -- custom height
        padding = {
            top = 1,       -- padding from top of screen
            right = 0,     -- padding from right of screen
            bottom = 0,    -- padding from bottom of screen
            left = 0,      -- padding from left of screen
        },
        border = 'single' -- border style ('none', 'single', 'double', 'rounded', 'solid', 'shadow')
    },
})
