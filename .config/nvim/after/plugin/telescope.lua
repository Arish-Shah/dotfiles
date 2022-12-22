local ok, telescope = pcall(require, "telescope")
if not ok then
  vim.notify("telescope not installed!")
  return
end

local ok, builtin = pcall(require, "telescope.builtin")
if not ok then
  vim.notify("telescope.builtin not installed!")
  return
end

telescope.setup({
  defaults = {
    file_ignore_patterns = {"node_modules"},
  },
})

vim.keymap.set("n", "<C-p>", builtin.find_files)
