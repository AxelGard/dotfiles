vim.g.mapleader = " " -- leader key for cmd not std vim cmd 

local keymap = vim.keymap

-- my own keymaps
--      sets ctrl-s to save and goto normal mode 
keymap.set("i", "<C-s>", "<Esc>:w<CR>")
keymap.set("n", "<C-s>", "<Esc>:w<CR>")
keymap.set("v", "<C-s>", "<Esc>:w<CR>")

--      ctrl-z to undo 
keymap.set("i", "<C-z>", "<Esc>:u<CR>")
keymap.set("n", "<C-z>", "<Esc>:u<CR>")

-- ctrl-q to quit 
keymap.set("i", "<C-q>", "<Esc>:qa<CR>")
keymap.set("n", "<C-q>", "<Esc>:qa<CR>")

-- general keymaps 
keymap.set("n", "<leader>ch", "nohl<CR>") -- rm highlights from seach 

keymap.set("n", "x", '"_x') -- dont copy singel char when using x in normal mode 

-- nvim tree 
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- Spell
keymap.set("n", "<leader>ss", "z=") -- open the list of suggestions
keymap.set("n", "<leader>sn", "]s") -- will go to the next misspelled word.
keymap.set("n", "<leader>sp", "[s") -- will go to the previous misspelled word.
keymap.set("n", "<leader>sr", ":spellr") -- spell repeater
keymap.set("n", "<leader>sa", "zg") -- add word to word list 

-- Normal --
-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")

-- Open and close buffers 
keymap.set("n", "<C-n>", "<C-w>v")-- vim <C-w>v -- split window vertically
keymap.set("n", "<C-m>", "<C-w>s")-- vim <C-w>s -- split window horizontally
keymap.set("n", "<C-e>", "<C-w>=")-- vim <C-w>= -- make split windows equal width & height

-- Resize with arrows
keymap.set("n", "<C-Up>", ":resize -2<CR>")
keymap.set("n", "<C-Down>", ":resize +2<CR>")
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
keymap.set("n", "<A-l>", ":bnext<CR>")
keymap.set("n", "<A-h>", ":bprevious<CR>")

-- Move text up and down
keymap.set("n", "<S-j>", "<Esc>:m .+1<CR>==gi")
keymap.set("n", "<S-k>", "<Esc>:m .-2<CR>==gi")

-- Insert --
-- Press jk fast to enter
-- keymap.set("i", "jk", "<ESC>")

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


