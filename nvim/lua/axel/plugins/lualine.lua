-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
  return
end

-- get lualine theme
local lualine_theme = require("lualine.themes.onedark")


-- configure lualine with modified theme
lualine.setup {
  options = {
    theme = 'oneokai',
    section_separators = '', 
    component_separators = '|',
  },
}
