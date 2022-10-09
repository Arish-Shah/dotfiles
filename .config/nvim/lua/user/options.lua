local o = vim.opt
local g = vim.g
local cmd = vim.cmd

g.loaded = 1
g.loaded_netrwPlugin = 1

o.number = true
o.relativenumber = false
o.mouse = "a"
o.hidden = true
o.swapfile = false
o.backup = false
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true
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
o.signcolumn = "yes"
o.cursorline = true
o.wrap = false
o.background = "dark"
o.autoread = true
o.completeopt = { "menu", "menuone", "noselect" }
o.clipboard = o.clipboard + "unnamedplus"
o.showmatch = false
o.updatetime = 500
o.splitbelow = true
o.splitright = true
o.shell = "zsh"

-- remove whitespace on save
cmd([[au BufWritePre * :%s/\s\+$//e]])
cmd([[au BufEnter * set fo-=c fo-=r fo-=o]])

