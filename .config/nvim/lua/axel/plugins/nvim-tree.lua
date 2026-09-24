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

