vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

local on_attach = function()
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition)
  vim.keymap.set("n", "K", vim.lsp.buf.hover)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help)
  vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder)
  vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder)
  vim.keymap.set("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end)
  vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
  vim.keymap.set("n", "gr", vim.lsp.buf.references)
  vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format { async = true } end)
end

local servers = {
  lua_ls = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
        telemetry = { enable = false },
      },
    }
  },
  pyright = {},
  tsserver = {},
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require("lspconfig")[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}
