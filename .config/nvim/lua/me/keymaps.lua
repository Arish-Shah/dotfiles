vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- normal
vim.keymap.set({ "n", "v" }, "<space>", "<Nop>", { silent = true })

vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>l", "<C-w>l")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux_project<CR>")

vim.keymap.set("n", "<C-h>", vim.cmd.Ex)

vim.keymap.set("n", "<leader>cq", "<cmd>%s/\'/\"/g<CR>")

-- visual
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv")
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv")
