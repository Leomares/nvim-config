return {
  {
    "saghen/blink.cmp",
    version = "*",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    event = "InsertEnter",
    opts = {
      keymap = {
        preset = "default",
        ["<C-y>"]   = { "select_and_accept" },
        ["<C-e>"]   = { "hide" },
        ["<C-k>"]   = { "select_prev", "fallback" },
        ["<C-j>"]   = { "select_next", "fallback" },
        ["<C-b>"]   = { "scroll_documentation_up", "fallback" },
        ["<C-f>"]   = { "scroll_documentation_down", "fallback" },
        ["<Tab>"]   = { "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 200 },
        ghost_text = { enabled = true },
      },
    },
  },
}
