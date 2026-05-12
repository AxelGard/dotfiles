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


-- show names of LSP clients attached to the current buffer
local function lsp_clients()
  local buf = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients({ bufnr = buf })
  if #clients == 0 then
    return 'No LSP'
  end
  local names = {}
  for _, client in ipairs(clients) do
    table.insert(names, client.name)
  end
  return ' ' .. table.concat(names, ', ')
end

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
    lualine_c = { 'diagnostics' },
    lualine_x = { lsp_clients },
    lualine_y = { 'filetype', 'fileformat' },
    lualine_z = {
      { 'location', separator = { left = '' }, left_padding = 2 },
    },
  },
}
