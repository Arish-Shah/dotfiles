-- global editor
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.colorcolumn = "80"

-- basic keymaps
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>l", "<C-w>l")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux_sessionizer<CR>")

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- install lazy.nvim plugin manager
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error("Error cloning lazy.nvim:\n" .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- configure and install plugins
require("lazy").setup({
  "tpope/vim-sleuth", -- detect tabstop and shiftwidth automatically

  { -- soho vibes for neovim
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    opts = {
      styles = {
        italic = false,
      },
    },
    init = function()
      vim.cmd.colorscheme "rose-pine"
    end,
  },

  { -- fuzzy finder
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    branch = "0.1.x",
     dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    },
    config = function()
      require("telescope").setup {}

      local builtin = require "telescope.builtin"
      vim.keymap.set("n", "<C-p>", builtin.find_files)
      vim.keymap.set("n", "<C-g>", builtin.live_grep)
    end,
  },

  { -- statusline
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        globalstatus = true,
        component_separators = "|",
        section_separators = "",
      },
    },
  },

  { -- LSP
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", config = true },
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("config-lsp-attach", { clear = true }),
        callback = function(event)
          local map = function(keys, func, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = event.buf })
          end

          map("K", vim.lsp.buf.hover)
          map("gd", require("telescope.builtin").lsp_definitions)
          map("gr", require("telescope.builtin").lsp_references)
          map("gi", require("telescope.builtin").lsp_implementations)
          map("<leader>D", require("telescope.builtin").lsp_type_definitions)
          map("<leader>rn", vim.lsp.buf.rename)
          map("<leader>ca", vim.lsp.buf.code_action, { "n", "x" })
          map("gD", vim.lsp.buf.declaration)
          map("<leader>f", function() vim.lsp.buf.format { async = true } end)
        end,
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

      local servers = {
        pyright = {},
        ts_ls = {},
      }

      require("mason").setup()

      local ensure_installed = vim.tbl_keys(servers or {})

      require("mason-lspconfig").setup {
        ensure_installed = ensure_installed,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
            require("lspconfig")[server_name].setup(server)
          end,
        },
      }
    end,
  },

  { -- autocompletion
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = { "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip", "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-path" },
    config = function()
      local cmp = require "cmp"
      local luasnip = require "luasnip"
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = "menu,menuone,noinsert" },
        mapping = cmp.mapping.preset.insert {
          ["<CR>"] = cmp.mapping.confirm { select = true },
          ["<C-Space>"] = cmp.mapping.complete {},
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
        },
      }
    end,
  },

  { -- highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    opts = {
      ensure_installed = { "html", "javascript", "lua", "python", "typescript" },
      sync_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    },
  },

  { -- autopairs
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  { -- comments
    "numToStr/Comment.nvim",
    opts = {}
  },

  { -- file explorer
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup {
        view = {
          number = true,
          relativenumber = true,
        },
        renderer = {
          icons = {
            show = {
              file = vim.g.have_nerd_font,
              folder = vim.g.have_nerd_font,
              folder_arrow = vim.g.have_nerd_font,
            },
          },
        },
        on_attach = function(bufnr)
          local api = require "nvim-tree.api"

          local function opts()
            return { buffer = bufnr, noremap = true, silent = true, nowait = true }
          end

          -- default mappings
          api.config.mappings.default_on_attach(bufnr)

          -- custom mappings
          local function edit_or_open()
            local node = api.tree.get_node_under_cursor()
            if node.nodes ~= nil then
              api.node.open.edit()
            else
              api.node.open.edit()
              api.tree.close()
            end
          end

          local function vsplit_preview()
            local node = api.tree.get_node_under_cursor()
            if node.nodes ~= nil then
              api.node.open.edit()
            else
              api.node.open.vertical()
            end
            api.tree.focus()
          end

          vim.keymap.set("n", "l", edit_or_open, opts())
          vim.keymap.set("n", "L", vsplit_preview, opts())
          vim.keymap.set("n", "h", api.tree.close, opts())
          vim.keymap.set("n", "H", api.tree.collapse_all, opts())
        end,
      }

      vim.api.nvim_set_keymap("n", "<C-h>", ":NvimTreeToggle<cr>", { silent = true, noremap = true })
    end,
  },
})
