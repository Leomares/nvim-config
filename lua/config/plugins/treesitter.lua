require("nvim-treesitter").setup({
  ensure_installed = {
    "python",
    "r",
    "javascript",
    "typescript",
    "tsx",
    "lua",
    "markdown",
    "markdown_inline",
    "bash",
    "json",
    "yaml",
  },
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
})
