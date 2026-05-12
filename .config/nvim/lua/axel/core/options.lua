local opt = vim.opt -- for concieness

-- line numbers 
opt.relativenumber = false
opt.number = true 

opt.mouse = "a"

-- tab & indent 
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line wrapping 
opt.wrap = false

-- search settings 
opt.ignorecase = true
opt.smartcase = true

-- curosr line, a line where the curser are at 
opt.cursorline = true

-- apperance 
opt.termguicolors = true
--opt.background = "dark" -- will defualt colorschemes to dark version 
opt.signcolumn = "yes"

-- backspace fix 
opt.backspace = "indent,eol,start"

-- yank/delete to system clipboard (Ctrl+V in other apps).
-- Use only 'unnamedplus' on Linux/Wayland — adding 'unnamed' also syncs
-- the PRIMARY selection, which on Wayland forks a second wl-copy daemon
-- that races with the CLIPBOARD one and makes Ctrl+V flaky.
vim.opt.clipboard = 'unnamedplus'

-- split windows 
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

-- swap files 
vim.opt.swapfile = false
-- spell 
--opt.spelllang = 'en_us'
--opt.spell = true
