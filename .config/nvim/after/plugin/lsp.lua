local ok, lsp = pcall(require, "lsp-zero")
if not ok then
  vim.notify("lsp-zero not installed!")
  return
end

local ok, cmp = pcall(require, "cmp")
if not ok then
  vim.notify("cmp not installed!")
  return
end

lsp.preset("recommended")

lsp.ensure_installed({
  "pyright",
  "tsserver"
})

local cmp_mappings = lsp.defaults.cmp_mappings({
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
  suggest_lsp_servers = false,
})

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
})
