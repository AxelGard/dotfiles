local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>ft', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require('telescope').setup{ 
    defaults = { 
        mappings = {
            i = {
            }

        },
        file_ignore_patterns = { 
            "node_modules" ,
            "__pycache__",
            "env"
        }
    }
}
