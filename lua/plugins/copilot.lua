return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false },  -- handled by blink-cmp-copilot
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = false,
      },
    },
  },
  {
    "giuxtaposition/blink-cmp-copilot",
    dependencies = {
      "zbirenbaum/copilot.lua",
      "saghen/blink.cmp",
    },
    -- Activate by adding "copilot" to blink.cmp sources.default.
    -- Done here to keep completion.lua minimal:
    specs = {
      {
        "saghen/blink.cmp",
        opts = {
          sources = {
            default = { "lsp", "path", "snippets", "buffer", "copilot" },
            providers = {
              copilot = {
                name = "copilot",
                module = "blink-cmp-copilot",
                score_offset = 100,
                async = true,
              },
            },
          },
        },
      },
    },
  },
}
