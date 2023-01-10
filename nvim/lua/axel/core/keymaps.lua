vim.g.mapleader = " " -- leader key for cmd not std vim cmd

local keymap = vim.keymap

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- my own keymaps
--      sets ctrl-s to save and goto normal mode
keymap.set("i", "<C-s>", "<Esc>:w<CR>")
keymap.set("n", "<C-s>", "<Esc>:w<CR>")
keymap.set("v", "<C-s>", "<Esc>:w<CR>")

-- general keymaps
keymap.set("n", "<leader>ch", "nohl<CR>") -- rm highlights from seach

keymap.set("n", "x", '"_x') -- dont copy singel char when using x in normal mode

-- nvim tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer


-- Normal --
-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")

-- Open and close buffers
-- keymap.set("n", "<C-v>", "<C-w>v")-- vim <C-w>v -- split window vertically
-- keymap.set("n", "<C->", "<C-w>s")-- vim <C-w>s -- split window horizontally
-- keymap.set("n", "<C-w>e", "<C-w>=")-- vim <C-w>= -- make split windows equal width & height
keymap.set("n", "<C-w>q", ":close<CR>") -- close current split window

-- Resize with arrows
keymap.set("n", "<C-Up>", ":resize -2<CR>")
keymap.set("n", "<C-Down>", ":resize +2<CR>")
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
keymap.set("n", "<S-l>", ":bnext<CR>")
keymap.set("n", "<S-h>", ":bprevious<CR>")

-- Move text up and down
keymap.set("n", "<A-j>", "<Esc>:m .+1<CR>==gi")
keymap.set("n", "<A-k>", "<Esc>:m .-2<CR>==gi")

-- Insert --
-- Press jk fast to enter
keymap.set("i", "jk", "<ESC>")

-- Visual --
-- Stay in indent mode
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Move text up and down
keymap.set("v", "<A-j>", ":m .+1<CR>==")
keymap.set("v", "<A-k>", ":m .-2<CR>==")
keymap.set("v", "p", '"_dP')

-- Visual Block --
-- Move text up and down
keymap.set("x", "J", ":move '>+1<CR>gv-gv")
keymap.set("x", "K", ":move '<-2<CR>gv-gv")
keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv")
keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv")





-- window management

-- window tabs
-- keymap.set("n", "<S-n>", ":tabnew<CR>") -- open new tab
-- keymap.set("n", "<S-q>", ":tabclose<CR>") -- close current tab
-- keymap.set("n", "<S-l>", ":tabn<CR>") --  go to next tab
-- keymap.set("n", "<S-h>", ":tabp<CR>") --  go to previous tab