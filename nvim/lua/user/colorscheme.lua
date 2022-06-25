vim.cmd [[
try
  colorscheme one_monokai
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
