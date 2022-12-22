local ok, tree = pcall(require, "nvim-tree")
if not ok then
  vim.notify("nvim-tree not installed!")
  return
end

tree.setup({
  view = {
    mappings = {
      custom_only = false,
      list = {
        { key = "l", action = "edit", action_cb = edit_or_open },
        { key = "L", action = "vsplit_preview", action_cb = vsplit_preview },
        { key = "h", action = "close_node" },
        { key = "H", action = "collapse_all", action_cb = collapse_all },
      },
    },
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
})

vim.keymap.set("n", "<C-h>", "<cmd>NvimTreeToggle<CR>")
