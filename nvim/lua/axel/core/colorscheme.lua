-- vim.cmd("colorscheme onedark")
-- one_monokai
-- everforest
-- sonokai
local status, colsch = pcall(vim.cmd,"colorscheme one_monokai") -- same as abow just proteced call instead 
if not status then
    print("colorsheme not found!")
    return
end

