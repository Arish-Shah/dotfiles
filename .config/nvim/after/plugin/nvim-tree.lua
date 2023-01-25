local ok, tree = pcall(require, "nvim-tree")
if not ok then
  vim.notify("nvim-tree not installed!")
  return
end

local ok2, lib = pcall(require, "nvim-tree.lib")
if not ok2 then
  vim.notify("nvim-tree.lib not found!")
  return
end

local ok3, view = pcall(require, "nvim-tree.view")
if not ok3 then
  vim.notify("nvim-tree.view not found!")
  return
end

local function edit_or_open()
  -- open as vsplit on current node
  local action = "edit"
  local node = lib.get_node_at_cursor()

  -- Just copy what"s done normally with vsplit
  if node.link_to and not node.nodes then
    require("nvim-tree.actions.node.open-file").fn(action, node.link_to)
    view.close() -- Close the tree if file was opened

  elseif node.nodes ~= nil then
    lib.expand_or_collapse(node)

  else
    require("nvim-tree.actions.node.open-file").fn(action, node.absolute_path)
    view.close() -- Close the tree if file was opened
  end
end

tree.setup({
  view = {
    mappings = {
      custom_only = false,
      list = {
        { key = "l", action = "edit", action_cb = edit_or_open },
        { key = "h", action = "close_node" },
      },
    },
  },
  actions = {
    open_file = {
      quit_on_open = false
    },
  },
  renderer = {
    icons = {
      show = {
        file = false,
        folder = true,
        folder_arrow = false,
        git = false,
        modified = false,
      },
      glyphs = {
        folder = {
          arrow_open = "▾",
          arrow_closed = "▸",
          default = "▸",
          open = "▾",
          empty = "▸",
          empty_open = "▾",
          symlink = "▸",
          symlink_open = "▾"
        }
      },
    }
  },
})

vim.keymap.set("n", "<C-h>", ":NvimTreeToggle<cr>")
