return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = {
      style = "night",
      transparent = false,
      styles = {
        sidebars = "dark",
        floats = "dark",
      },
    },
    init = function()
      vim.cmd.colorscheme("tokyonight-night")
    end,
  },
}
