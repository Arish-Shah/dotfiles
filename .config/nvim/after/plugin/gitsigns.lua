local ok, gitsigns = pcall(require, "gitsigns")
if not ok then
  vim.notify("gitsigns not installed!")
  return
end

gitsigns.setup()
