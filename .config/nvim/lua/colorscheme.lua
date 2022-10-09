local name = "gruvbox"

local status_ok, colorscheme = pcall(require, name)
if not status_ok then
  vim.notify("colorscheme " .. name .. " not found!")
  return
end

colorscheme.setup({
  italic = false
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. name)
if not status_ok then
  vim.notify("colorscheme " .. name .. " not found!")
  return
end
