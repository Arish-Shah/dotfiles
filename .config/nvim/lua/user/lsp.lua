-- language servers auto-installation
local status_ok, mason = pcall(require, "mason")
if not status_ok then
  vim.notify("mason not found!")
  return
end

local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
  vim.notify("mason-lspconfig not found!")
  return
end

local servers = { "tsserver", "jsonls" }

mason.setup()
mason_lspconfig.setup({
  ensure_installed = servers
})

-- add additional capabilities supported by nvim-cmp
local opts = { noremap=true, silent=true }

local map = vim.keymap.set

map("n", "<leader>i", vim.diagnostic.open_float, opts)
map("n", "[d", vim.diagnostic.goto_prev, opts)
map("n", "]d", vim.diagnostic.goto_next, opts)
map("n", "<leader>q", vim.diagnostic.setloclist, opts)

-- use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- mappings.
  -- see `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  map("n", "gD", vim.lsp.buf.declaration, bufopts)
  map("n", "gd", vim.lsp.buf.definition, bufopts)
  map("n", "K", vim.lsp.buf.hover, bufopts)
  map("n", "gi", vim.lsp.buf.implementation, bufopts)
  map("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  map("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
  map("n", "<leader>r", vim.lsp.buf.rename, bufopts)
  map("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
  map("n", "gr", vim.lsp.buf.references, bufopts)
  map("n", "<leader>f", function() vim.lsp.buf.format { async = true } end, bufopts)

  -- disable language server's formatting capabilities
  for _, lsp in ipairs(servers) do
    if client.name == lsp then
      client.resolved_capabilities.document_formatting = false -- 0.7 and earlier
    end
  end
end
-- if client.name == "tsserver" then
-- end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmd_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  vim.notify("cmp_nvim_lsp not found!")
  return
end

capabilities = cmd_nvim_lsp.update_capabilities(capabilities)

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("lspconfig not found!")
  return
end

-- enable some language servers with the additional completion capabilities offered by nvim-cmp
lspconfig.tsserver.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.jsonls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    json = {
      schemas = {
        {
          description = "NPM configuration file",
          fileMatch = { "package.json" },
          url = "https://json.schemastore.org/package.json",
        },
        {
          description = "TypeScript compiler configuration file",
          fileMatch = { "tsconfig.json", "tsconfig.*.json" },
          url = "https://json.schemastore.org/tsconfig.json",
        },
        {
          description = "Prettier config",
          fileMatch = { ".prettierrc", ".prettierrc.json", "prettier.config.json" },
          url = "https://json.schemastore.org/prettierrc",
        }
      }
    }
  }
})

-- loop over all the language servers at once
-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--   }
-- end

-- luasnip setup
local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
  vim.notify("luasnip not found!")
  return
end

-- nvim-cmp setup
local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
  vim.notify("cmp not found!")
  return
end

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
  },
})
