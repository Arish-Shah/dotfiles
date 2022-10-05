require("gruvbox").setup {
    italic = false
}

require("lualine").setup()

require("telescope").setup {
    file_ignore_patterns = {
        "./node_modules/*",
        "node_modules",
        "^node_modules/*",
        "node_modules/*"    
    },
}

require("nvim-autopairs").setup()

local o = vim.opt
local g = vim.g

o.number = true
o.relativenumber = true

o.mouse = "a"

o.hidden = true
o.swapfile = false
o.backup = false

o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true

o.scrolloff = 8
o.colorcolumn = "80"

o.incsearch = true
o.smartcase = true
o.ignorecase = true
o.hlsearch = false

o.termguicolors = true
o.showmode = false
o.signcolumn = "yes"
o.cursorline = true
o.wrap = false
o.background = "dark"

o.autoread = true

o.completeopt = { "menu", "menuone", "noselect" }

g.mapleader = " "

vim.cmd([[colorscheme gruvbox]])
