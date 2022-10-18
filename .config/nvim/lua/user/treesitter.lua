local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  vim.notify("treesitter config not found!")
  return
end

configs.setup({
  ensure_installed = { "lua" },
  highlight = {
    enable = true
  }
})
