-- vim.cmd("colorscheme onedark")
-- one_monokai
-- everforest
-- sonokai
-- oneokai
-- gruvbox
-- dracula
require('oneokai').setup {
    ending_tildes = true,
    style = "dark" --'darker', gruvbox_material
}
require('oneokai').load()


require('onedark').setup {
    style = 'dark',
}

require("everforest").setup({
    background = "hard",
    transparent_background_level = 2
})

require("catppuccin").setup({
    flavour = "mocha",

})



local status, colsch = pcall(vim.cmd,"colorscheme oneokai") -- same as abow just proteced call instead 

if not status then
    print("colorsheme not found!")
    return
end

