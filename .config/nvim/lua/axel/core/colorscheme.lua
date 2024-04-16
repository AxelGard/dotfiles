-- vim.cmd("colorscheme onedark")
-- one_monokai
-- everforest
-- sonokai
-- oneokai
-- gruvbox
-- dracula
local _style = 'darker'
require('oneokai').setup {
    style = _style,
}
require('oneokai').load()

require("everforest").setup({
    background = "hard",
    transparent_background_level = 2
})



local status, colsch = pcall(vim.cmd,"colorscheme oneokai") -- same as abow just proteced call instead 
if not status then
    print("colorsheme not found!")
    return
end

