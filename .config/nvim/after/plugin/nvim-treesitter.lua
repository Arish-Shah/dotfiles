local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
  vim.notify("nvim-treesitter not found!")
  return
end

treesitter.setup({
  ensure_installed = { "lua", "python" },
})
