local ok, autopairs = pcall(require, "nvim-autopairs")
if not ok then
  vim.notify("nvim-autopairs not installed!")
  return
end

autopairs.setup()
