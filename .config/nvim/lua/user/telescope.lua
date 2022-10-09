local opts = { noremap=true, silent=true }
local map = vim.keymap.set

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  vim.notify("telescope not found!")
end

local status_ok, builtin = pcall(require, "telescope.builtin")
if not status_ok then
  vim.notify("telescope.builtin not found!")
end

telescope.setup({
  defaults = {
    file_ignore_patterns = {"node_modules"}
  }
})

map("n", "<C-p>", builtin.find_files, opts)
map("n", "<C-f>", builtin.live_grep, opts)
