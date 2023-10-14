local opt = vim.opt -- for concieness 

-- line numbers 
opt.relativenumber = true 
opt.number = true 


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
-- opt.curserline = false 

-- apperance 
opt.termguicolors = true 
opt.background = "dark" -- will defualt colorschemes to dark version 
opt.signcolumn = "yes" 

-- backspace fix 
opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

-- split windows 
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

-- swap files 
vim.opt.swapfile = false
-- spell 
--opt.spelllang = 'en_us'
--opt.spell = true
