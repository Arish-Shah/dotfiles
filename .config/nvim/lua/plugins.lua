vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    -- packer can manage itself
    use "wbthomason/packer.nvim"
    
    -- gruvbox colorscheme
    use "ellisonleao/gruvbox.nvim"

    -- lualine
    use {
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
        config = function()
            require("lualine").setup()
        end,
    }

    -- telescope
    use {
        "nvim-telescope/telescope.nvim", tag = "0.1.0",
        requires = { {"nvim-lua/plenary.nvim"} },
        config = function()
            require("telescope").setup {
                file_ignore_patterns = {
                    "./node_modules/*",
                    "node_modules",
                    "^node_modules/*",
                    "node_modules/*"    
                },
            }
        end,
    }

    use "neovim/nvim-lspconfig" -- configurations for nvim lsp

    -- lsp Autocomplete
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "L3MON4D3/LuaSnip"

    -- bracket pair
    use {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
        end,
    }
end)

