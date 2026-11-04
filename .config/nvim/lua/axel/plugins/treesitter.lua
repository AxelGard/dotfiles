require("nvim-treesitter.install").compilers = { "gcc", "cc", "clang" }

-- nvim-treesitter builds parsers with the tree-sitter CLI; without it :TSUpdate fails silently
if vim.fn.executable("tree-sitter") == 0 then
  vim.schedule(function()
    vim.notify(
      "tree-sitter CLI not found, :TSUpdate cannot build parsers.\n"
        .. "Install it from a terminal, in any directory (-g installs it globally for the active nvm Node version):\n"
        .. "  npm install -g tree-sitter-cli\n"
        .. "Then restart nvim and run :TSUpdate",
      vim.log.levels.WARN
    )
  end)
end

require("nvim-treesitter").setup({
  install_dir = vim.fn.stdpath("data") .. "/site",
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    vim.schedule(function()
      pcall(vim.treesitter.start, args.buf)
    end)
  end,
})
