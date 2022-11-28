local o = vim.opt
-- local g = vim.g
local cmd = vim.cmd

o.number = true
o.relativenumber = true
o.mouse = "a"
o.hidden = true
o.swapfile = false
o.backup = false
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = false
o.smartindent = true
o.autoindent = true
o.scrolloff = 8
o.colorcolumn = "80"
o.incsearch = true
o.smartcase = true
o.ignorecase = true
o.hlsearch = false
o.termguicolors = true
o.showmode = false
o.signcolumn = "number"
o.cursorline = true
o.wrap = false
o.autoread = true
o.completeopt = { "menu", "menuone", "noselect" }
o.showmatch = false
o.updatetime = 500
o.splitbelow = true
o.splitright = true
o.shell = "zsh"
o.background = "dark"

-- get out of comment
cmd([[au BufEnter * set fo-=c fo-=r fo-=o]])
