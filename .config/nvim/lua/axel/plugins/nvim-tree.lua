-- import nvim-tree plugin safely
local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
  return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree to light blue
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

-- configure nvim-tree
nvimtree.setup({
  -- follow the file you're editing and highlight it in the tree
  update_focused_file = {
    enable = true,
    update_root = false, -- keep tree root fixed; set true to also cd into the file's project
  },
  -- change folder arrow icons
  renderer = {
    highlight_opened_files = "name", -- highlight names of files open in a buffer
    icons = {
      glyphs = {
        folder = {
          arrow_closed = ">", -- arrow when folder is closed
          arrow_open = "v", -- arrow when folder is open
        },
      },
    },
  },
  -- disable window_picker for
  -- explorer to work well with
  -- window splits
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
-- 	git = {
-- 		ignore = false,
-- 	},
})

-- right-click menu entries for copying the path of the node under the mouse
-- (right-click moves the cursor there first since mousemodel=popup_setpos)
local copy_items = {
  { "Copy\\ Absolute\\ Path", "absolute_path" },
  { "Copy\\ Relative\\ Path", "relative_path" },
  { "Copy\\ Name", "filename" },
}
for _, item in ipairs(copy_items) do
  vim.cmd(string.format([[amenu PopUp.%s <Cmd>lua require("nvim-tree.api").fs.copy.%s()<CR>]], item[1], item[2]))
end

-- only show them when right-clicking inside the tree
vim.api.nvim_create_autocmd("MenuPopup", {
  callback = function()
    local state = vim.bo.filetype == "NvimTree" and "enable" or "disable"
    for _, item in ipairs(copy_items) do
      vim.cmd("amenu " .. state .. " PopUp." .. item[1])
    end
  end,
})

