
-- import yanklocation plugin safely
local status, yanklocation = pcall(require, 'yanklocation')
if not status then
  return
end

yanklocation.setup({
    mode = 'v',             -- mode(s) for the keymap, e.g. { 'n', 'v' }
    keymap = 't',   -- set to false to skip creating a keymap
    register = '+',         -- register to yank into ('+' is the system clipboard)
    absolute_path = true,  -- yank the absolute path instead of the relative one
})
