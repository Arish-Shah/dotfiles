local opts = { noremap=true, silent=true }
local map = vim.keymap.set

local status_ok_1, telescope = pcall(require, "telescope")
if not status_ok_1 then
  vim.notify("telescope not found!")
  return
end

local status_ok_2, builtin = pcall(require, "telescope.builtin")
if not status_ok_2 then
  vim.notify("telescope.builtin not found!")
  return
end

telescope.setup({
  defaults = {
    file_ignore_patterns = {"node_modules"}
  }
})

map("n", "<C-p>", builtin.find_files, opts)
map("n", "<C-f>", builtin.live_grep, opts)
