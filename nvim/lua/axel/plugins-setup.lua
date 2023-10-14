-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- add list of plugins to install
return packer.startup(function(use)
  -- packer can manage itself
  use("wbthomason/packer.nvim")
  use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

  -- color schems installed 
  use("cpea2506/one_monokai.nvim")
  use("navarasu/onedark.nvim")
  use("neanias/everforest-nvim")
  
  use "AxelGard/oneokai.nvim"

  use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

  -- file explorer
  use("nvim-tree/nvim-tree.lua")

  -- vs-code like icons
  use("kyazdani42/nvim-web-devicons")
  -- vs-code like git changes 
  use('lewis6991/gitsigns.nvim')

  -- statusline
  use("nvim-lualine/lualine.nvim")

  -- tabs 
  use({
      'romgrk/barbar.nvim',
      requires = {'kyazdani42/nvim-web-devicons'}
     })

  -- terminal 
  use("numToStr/FTerm.nvim")

  -- find window 
  use('nvim-telescope/telescope.nvim')

  -- enclosing {[]}
  use ({
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
    })

  -- rainbow [{()}]
    --use 'luochen1990/rainbow'
    use 'mrjones2014/nvim-ts-rainbow'
    
  -- dashbord
  use 'goolord/alpha-nvim'

  -- For swithcing py env 
  use 'AckslD/swenv.nvim'
  use {'stevearc/dressing.nvim'}

  -- show hex colors 
  use 'norcalli/nvim-colorizer.lua'

  -- which key 
use {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}

-- indent line
-- use "lukas-reineke/indent-blankline.nvim"

 -- commenting with gc
  use("numToStr/Comment.nvim")

  -- autocompletion
  use("hrsh7th/nvim-cmp") -- completion plugin
  use("hrsh7th/cmp-buffer") -- source for text in buffer
  use("hrsh7th/cmp-path") -- source for file system paths

  -- snippets
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("saadparwaiz1/cmp_luasnip") -- for autocompletion
  use("rafamadriz/friendly-snippets") -- useful snippets

 -- managing & installing lsp servers, linters & formatters
  use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
  use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

  -- configuring lsp servers
  use("neovim/nvim-lspconfig") -- easily configure language servers
  use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
  --use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
        require("lspsaga").setup({})
    end,
    requires = { {"nvim-tree/nvim-web-devicons"} }
    })
  use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
  use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

  -- formatting & linting
  use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
  use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls 

  -- tree sitter 
  use({
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    })

if packer_bootstrap then
    require("packer").sync()
  end
end)
