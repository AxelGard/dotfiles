-- vim.cmd("colorscheme onedark")
local status, _ = pcall(vim.cmd,"colorscheme onedark") -- same as abow just proteced call instead 
if not status then 
    print("colorsheme not found!")
    return 
end 
