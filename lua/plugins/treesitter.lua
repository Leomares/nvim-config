return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ensure_installed = {
        "python", "r", "javascript", "typescript", "tsx",
        "lua", "markdown", "markdown_inline", "bash", "json", "yaml",
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    },
    -- no longer needed with lazy.nvim's built-in support for plugin options
--    config = function(_, opts)
--      require("nvim-treesitter.configs").setup(opts)
--    end,
  },
}
