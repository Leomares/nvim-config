return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = {
        "ruff",
        "lua_ls",
      },
      automatic_installation = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- local lspconfig = require("lspconfig") -- deprecated interface, prefer vim.lsp.config(...)
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- local on_attach = function(_, bufnr)
      --   local map = function(keys, func, desc)
      --     vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
      --   end
      --   map("gd",         vim.lsp.buf.definition,      "Go to definition")
      --   map("gD",         vim.lsp.buf.declaration,     "Go to declaration")
      --   map("gr",         vim.lsp.buf.references,      "References")
      --   map("gi",         vim.lsp.buf.implementation,  "Go to implementation")
      --   map("K",          vim.lsp.buf.hover,           "Hover docs")
      --   map("<leader>rn", vim.lsp.buf.rename,          "Rename")
      --   map("<leader>ca", vim.lsp.buf.code_action,     "Code action")
      --   map("<leader>lf", vim.lsp.buf.format,          "Format")
      --   map("<leader>lm", "<cmd>Mason<CR>",            "Mason")
      --   map("[d",         vim.diagnostic.goto_prev,    "Prev diagnostic")
      --   map("]d",         vim.diagnostic.goto_next,    "Next diagnostic")
      --   map("<leader>ld", vim.diagnostic.open_float,   "Diagnostic float")
      -- end

      -- newer version of lspconfig
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
        -- Your keymaps and settings go here (e.g., vim.keymap.set)
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = "LSP: " .. desc })
        end
        map("gd",         vim.lsp.buf.definition,      "Go to definition")
        map("gD",         vim.lsp.buf.declaration,     "Go to declaration")
        map("gr",         vim.lsp.buf.references,      "References")
        map("gi",         vim.lsp.buf.implementation,  "Go to implementation")
        map("K",          vim.lsp.buf.hover,           "Hover docs")
        map("<leader>rn", vim.lsp.buf.rename,          "Rename")
        map("<leader>ca", vim.lsp.buf.code_action,     "Code action")
        map("<leader>lf", vim.lsp.buf.format,          "Format")
        map("<leader>lm", "<cmd>Mason<CR>",            "Mason")
        map("[d",         vim.diagnostic.goto_prev,    "Prev diagnostic")
        map("]d",         vim.diagnostic.goto_next,    "Next diagnostic")
        map("<leader>ld", vim.diagnostic.open_float,   "Diagnostic float")
        end,
      })

      local servers = {
        ruff = {},
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              workspace = { checkThirdParty = false },
            },
          },
        },
      }

      for server, config in pairs(servers) do
      --  lspconfig[server].setup(vim.tbl_deep_extend("force", {
      --    capabilities = capabilities,
      --    on_attach = on_attach,
      --  }, config))
        vim.lsp.config(server, {
          capabilities = capabilities,
        },config)
        vim.lsp.enable(server)
      end

      -- Diagnostic signs
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
    end,
  },
}
