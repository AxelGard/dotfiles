--- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
  return
end
-- oneokai
-- catppuccin
-- get lualine theme
--local lualine_theme = require("lualine.themes.catppuccin")
local lualine_theme = require("lualine.themes.oneokai")


-- configure lualine with modified theme
lualine.setup {
  options = {
    theme = 'oneokai',
    section_separators = { left = '', right = '' },
    component_separators = { left = '|', right = '|' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { right = '' }, right_padding = 2 }, 
    },
    lualine_b = { 'filename', 'branch' },
    lualine_c = {},
    lualine_x = {},
    lualine_y = { 'filetype', 'fileformat' },
    lualine_z = {
      { 'location', separator = { left = '' }, left_padding = 2 },
    },
  },
}
