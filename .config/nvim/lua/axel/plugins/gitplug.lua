require('gitsigns').setup{
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 2000,
    ignore_whitespace = false,
    virt_text_priority = 100,
    use_focus = true,
  },
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({']c', bang = true})
      else
        gitsigns.nav_hunk('next')
      end
    end)

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({'[c', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end)

    -- Actions
    map('n', '<leader>gr', gitsigns.reset_hunk)
    map('n', '<leader>gh', gitsigns.preview_hunk)
    map('n', '<leader>gg', gitsigns.preview_hunk_inline)
    -- Toggles
    map('n', '<leader>gb', gitsigns.toggle_current_line_blame)

  end
}
