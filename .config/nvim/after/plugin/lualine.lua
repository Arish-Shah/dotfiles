local ok, lualine = pcall(require, "lualine")
if not ok then
  vim.notify("lualine not installed!")
  return
end

lualine.setup({
  options = {
    theme = "auto",
    component_separators = "|",
    section_separators = "",
    globalstatus = true,
  },
})
