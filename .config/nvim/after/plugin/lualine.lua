local ok, lualine = pcall(require, "lualine")
if not ok then
  vim.notify("lualine not found!")
  return
end

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = "|",
    section_separators = "",
    globalstatus = true
  },
})
