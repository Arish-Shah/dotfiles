vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    -- packer can manage itself
    use "wbthomason/packer.nvim"
    
    -- gruvbox colorscheme
    use "ellisonleao/gruvbox.nvim"

    -- lualine
    use {
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true }
    }

    -- telescope
    use {
        "nvim-telescope/telescope.nvim", tag = "0.1.0",
        requires = { {"nvim-lua/plenary.nvim"} }
    }
    
    -- configurations for nvim lsp
    use "neovim/nvim-lspconfig" 
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/nvim-cmp"
    -- for luasnip
    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"

    -- bracket pair
    use "windwp/nvim-autopairs"
end)
