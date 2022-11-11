-- autoinstall language servers
local status_ok_1, mason = pcall(require, "mason")
if not status_ok_1 then
  vim.notify("mason not found!")
  return
end

local status_ok_2, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_2 then
  vim.notify("mason-lspconfig not found!")
  return
end

local status_ok_3, lspconfig = pcall(require, "lspconfig")
if not status_ok_3 then
  vim.notify("lspconfig not found!")
  return
end

local status_ok_4, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok_4 then
  vim.notify("cmp_nvim_lsp not found!")
  return
end

local servers = { "sumneko_lua" }

mason.setup()
mason_lspconfig.setup({
  ensure_installed = servers
})

-- lsp keymaps
local opts = { noremap=true, silent=true }
local map = vim.keymap.set

map("n", "<space>e", vim.diagnostic.open_float, opts)
map("n", "[d", vim.diagnostic.goto_prev, opts)
map("n", "]d", vim.diagnostic.goto_next, opts)
map("n", "<space>q", vim.diagnostic.setloclist, opts)

local on_attach = function(_, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  map("n", "gD", vim.lsp.buf.declaration, bufopts)
  map("n", "gd", vim.lsp.buf.definition, bufopts)
  map("n", "K", vim.lsp.buf.hover, bufopts)
  map("n", "gi", vim.lsp.buf.implementation, bufopts)
  map("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  map("n", "<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  map("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
  map("n", "<space>rn", vim.lsp.buf.rename, bufopts)
  map("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
  map("n", "gr", vim.lsp.buf.references, bufopts)
  map("n", "<space>f", function() vim.lsp.buf.format { async = true } end, bufopts)
end

local capabilities = cmp_nvim_lsp.default_capabilities()

-- setup language servers
lspconfig.sumneko_lua.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      }
    }
  },
})

lspconfig.tsserver.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
