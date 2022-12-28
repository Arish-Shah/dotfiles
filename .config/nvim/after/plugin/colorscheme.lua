local name = "tokyonight"

local ok, colorscheme = pcall(require, name)
if not ok then
  vim.notify("colorscheme " .. name .. " not installed!")
  return
end

colorscheme.setup({
  disable_italics = true,
  italic = false,
  styles = {
    comments = { italic = false },
    keywords = { italic = false },
  }
})

vim.cmd.colorscheme(name .. "-night")
