
vim.keymap.set("n", "<leader>ha", function()
    require("harpoon.mark").add_file()
end)

vim.keymap.set("n", "<leader>hh", function()
    require("harpoon.ui").toggle_quick_menu()
end)

vim.keymap.set("n", "<leader>hn", function()
    require("harpoon.mark").nav_next()
end)

vim.keymap.set("n", "<leader>hp", function()
    require("harpoon.mark").nav_prev()
end)

vim.keymap.set("n", "<leader>hc", function()
    require("harpoon.mark").clear_all()
end)


vim.keymap.set("n", "<leader>h1", function()
    require("harpoon.ui").nav_file(1)
end)

vim.keymap.set("n", "<leader>h2", function()
    require("harpoon.ui").nav_file(2)
end)

vim.keymap.set("n", "<leader>h3", function()
    require("harpoon.ui").nav_file(3)
end)


-- vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
-- vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
-- vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
-- vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)
