local builtin = require('telescope.builtin')
--vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files hidden=true no_ignore=true<cr>")
vim.keymap.set('n', '<leader>ft', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require('telescope').setup{
    pickers = {
        find_files = {
          hidden = true, -- Now this is correctly placed
          -- Add other find_files specific options here if needed
        },
    },
    defaults = {
        mappings = {
            i = {
            }
        },
        file_ignore_patterns = {
            "node_modules/",
            "__pycache__/",
            "env/",
            ".git/",
            "build/",
        }
    }
}
