require("nvim-tree").setup()

local api = require("nvim-tree.api")

local function edit_or_open()
  local node = api.tree.get_node_under_cursor()

  if node.nodes ~= nil then
    api.node.open.edit()
  else
    api.node.open.edit()
    api.tree.close()
  end
end

local function vsplit_preview()
  local node = api.tree.get_node_under_cursor()

  if node.nodes ~= nil then
    api.node.open.edit()
  else
    api.node.open.vertical()
  end
  api.tree.focus()
end

vim.api.nvim_set_keymap("n", "<C-h>", ":NvimTreeToggle<cr>", { silent = true, noremap = true })

vim.keymap.set("n", "l", edit_or_open)
vim.keymap.set("n", "L", vsplit_preview)
vim.keymap.set("n", "h", api.tree.close)
vim.keymap.set("n", "H", api.tree.collapse_all)
