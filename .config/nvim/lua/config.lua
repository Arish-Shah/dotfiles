local o = vim.opt
local g = vim.g
local c = vim.cmd

c([[colorscheme gruvbox]])

g.mapleader = " "

o.number = true
o.relativenumber = true
o.mouse = "a"
o.hidden = true
o.swapfile = false
o.backup = false
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
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
-- o.showmatch = true
o.backspace = "indent,start,eol"
o.updatetime = 500
o.splitbelow = true
o.splitright = true
o.shell = "zsh"

-- remove whitespace on save
c([[au BufWritePre * :%s/\s\+$//e]])
c([[au BufEnter * set fo-=c fo-=r fo-=o]])
