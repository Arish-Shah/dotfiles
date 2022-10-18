local name = "gruvbox"

local status_ok_1, colorscheme = pcall(require, name)
if not status_ok_1 then
  vim.notify("colorscheme " .. name .. " not found!")
  return
end

colorscheme.setup({
  italic = false,
  -- styles = {
  --   comments = { italic = false },
  --   keywords = { italic = false },
  -- }
})

local status_ok_2, _ = pcall(vim.cmd, "colorscheme " .. name)
if not status_ok_2 then
  vim.notify("colorscheme " .. name .. " not found!")
  return
end
