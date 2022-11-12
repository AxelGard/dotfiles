vim.g.mapleader = " " -- leader key for cmd not std vim cmd 

local keymap = vim.keymap

-- my own keymaps
--      sets ctrl-s to save and goto normal mode 
keymap.set("i", "<C-s>", "<Esc>:w<CR>")
keymap.set("n", "<C-s>", "<Esc>:w<CR>")
keymap.set("v", "<C-s>", "<Esc>:w<CR>")

-- general keymaps 
keymap.set("n", "<leader>ch", "nohl<CR>") -- rm highlights from seach 

keymap.set("n", "x", '"_x') -- dont copy singel char when using x in normal mode 

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sc", ":close<CR>") -- close current split window

-- window tabs 
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tc", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- nvim tree 
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer
