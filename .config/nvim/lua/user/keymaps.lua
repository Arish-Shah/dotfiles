local opts = { noremap=true, silent=true }

local map = vim.keymap.set

-- map <space> as <leader> key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- NORMAL
-- better window navigation
map("n", "<leader>h", "<C-w>h", opts)
map("n", "<leader>j", "<C-w>j", opts)
map("n", "<leader>k", "<C-w>k", opts)
map("n", "<leader>l", "<C-w>l", opts)

map("n", "<leader>e", ":Lex 20<cr>", opts)

-- INSERT
map("i", "jk", "<ESC>", opts)

-- VISUAL
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- move text up and down
map("v", "<A-j>", ":m .+1<CR>==", opts)
map("v", "<A-k>", ":m .-2<CR>==", opts)
-- keep yanked buffer on paste
map("v", "p", '"_dP', opts)

-- VISUAL BLOCK
map("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
map("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
