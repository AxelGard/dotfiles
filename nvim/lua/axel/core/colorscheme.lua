-- vim.cmd("colorscheme onedark")
-- one_monokai
local status, colsch = pcall(vim.cmd,"colorscheme onedark") -- same as abow just proteced call instead 
if not status then
    print("colorsheme not found!")
    return
end

