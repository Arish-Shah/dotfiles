local builtin = require("telescope.builtin")

local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

map("n", "<leader><CR>", "<cmd>source ~/.config/nvim/init.lua<CR>")

-- telescope
map("n", "<C-p>", builtin.find_files)
map("n", "<C-f>", builtin.grep_string)
map("n", "<C-b>", builtin.buffers)

-- lsp
map("n", "K", vim.lsp.buf.hover)
map("n", "gd", vim.lsp.buf.definition)
map("n", "gT", vim.lsp.buf.type_definition)
map("n", "<leader>df", vim.diagnostic.goto_next)
map("n", "<leader>r", vim.lsp.buf.rename)
map("n", "<leader>o", vim.lsp.buf.code_action)

-- autocomplete
local cmp = require("cmp")

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    window = {},
    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
    }, {
        { name = "buffer" },
    })
})

-- configuration for specific filetype
cmp.setup.filetype("gitcommit", {
    sources = cmp.config.sources({
        { name = "cmp_git" },
    }, {
        { name = "buffer" },
    })
})

-- lspconfig
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
require("lspconfig")["clangd"].setup {
    capabilities = capabilities
}
require("lspconfig")["tsserver"].setup {
    capabilities = capabilities
}
