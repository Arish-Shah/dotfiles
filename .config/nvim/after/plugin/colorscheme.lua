local name = "rose-pine"

local ok, colorscheme = pcall(require, name)
if not ok then
  vim.notify("colorscheme " .. name .. " not installed!")
  return
end

colorscheme.setup({
  disable_italics = true,
})

vim.cmd.colorscheme(name)
