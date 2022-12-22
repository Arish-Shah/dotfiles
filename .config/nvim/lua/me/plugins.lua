local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")
  use {
    "VonHeikemen/lsp-zero.nvim",
    requires = {
      {"neovim/nvim-lspconfig"},
      {"williamboman/mason.nvim"},
      {"williamboman/mason-lspconfig.nvim"},

      {"hrsh7th/nvim-cmp"},
      {"hrsh7th/cmp-buffer"},
      {"hrsh7th/cmp-path"},
      {"saadparwaiz1/cmp_luasnip"},
      {"hrsh7th/cmp-nvim-lsp"},
      {"hrsh7th/cmp-nvim-lua"},

      -- Snippets
      {"L3MON4D3/LuaSnip"}
    }
  }
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })
  use("github/copilot.vim")
  use({
  "nvim-telescope/telescope.nvim", tag = "0.1.0",
    requires = { {"nvim-lua/plenary.nvim"} }
  })
  use("windwp/nvim-autopairs")
  use("numToStr/Comment.nvim")
  use("rose-pine/neovim")
  use("tpope/vim-sleuth")
  use("lewis6991/gitsigns.nvim")
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true }
  })
  use({
    "nvim-tree/nvim-tree.lua",
    requires = { "nvim-tree/nvim-web-devicons" },
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
