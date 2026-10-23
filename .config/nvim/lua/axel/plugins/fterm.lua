
require'FTerm'.setup({
    border = 'single',
    dimensions  = {
        height = 0.9,
        width = 0.9,
    },
})

-- Example keybindings
vim.keymap.set('n', "<C-t>", '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', "<C-t>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

-- Second, separate terminal on <C-y>
local second_term = require("FTerm"):new({
    border = 'single',
    dimensions  = {
        height = 0.9,
        width = 0.9,
    },
})

vim.keymap.set('n', "<C-y>", function() second_term:toggle() end)
vim.keymap.set('t', "<C-y>", function() second_term:toggle() end)
