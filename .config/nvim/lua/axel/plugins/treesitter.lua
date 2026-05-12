require("nvim-treesitter.install").compilers = { "gcc", "cc", "clang" }

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
