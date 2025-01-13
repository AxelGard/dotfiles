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
  use("ellisonleao/gruvbox.nvim")
  use "AxelGard/oneokai.nvim"
  use("dracula/vim")
  use { "catppuccin/nvim", as = "catppuccin" }

  use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

  -- file explorer
  use("nvim-tree/nvim-tree.lua")

  -- file explorer [[ The Primeagen ]]
  use('ThePrimeagen/harpoon')

  -- indent line 
  use ("lukas-reineke/indent-blankline.nvim")

  -- vs-code like icons
  use("kyazdani42/nvim-web-devicons")
  -- vs-code like git changes 
  use('lewis6991/gitsigns.nvim')

  -- statusline
  use("nvim-lualine/lualine.nvim")

  -- multi cursor
  use("mg979/vim-visual-multi")

  -- tabs 
  use({
      'romgrk/barbar.nvim',
      requires = {'kyazdani42/nvim-web-devicons'}
     })

  -- terminal 
  use("numToStr/FTerm.nvim")

  -- enclosing {[]}
  use ({
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
    })

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


  -- find window 
  use('nvim-telescope/telescope.nvim')

use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  requires = {
    --- Uncomment these if you want to manage LSP servers from neovim
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    -- LSP Support
    {'neovim/nvim-lspconfig'},
    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'L3MON4D3/LuaSnip'},
  }
}



 -- commenting with gc
  use("numToStr/Comment.nvim")

  -- tree sitter 
  use({
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ 
                with_sync = true,
                filesystem = {
                    filtered_items = {
                        visible = true,
                        hide_dotfiles = false,
                    --  hide_gitignored = false,
                    },
                }
            })
            ts_update()
        end,
    })

if packer_bootstrap then
    require("packer").sync()
  end
end)
