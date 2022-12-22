local languages = { "help", "lua" }

local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
  vim.notify("treesitter not installed!")
  return
end

treesitter.setup({
  ensure_installed = languages,
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  }
})
