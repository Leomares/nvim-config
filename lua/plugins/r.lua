-- R.nvim: R language support with radian REPL.
-- Completion is handled by R.nvim's built-in LSP (cmp-r is deprecated).
-- r_language_server is intentionally omitted from mason/lspconfig to avoid
-- running two R completion sources simultaneously (see R.nvim README).
-- Looks for radian in .venv/bin/radian first, then system radian, then plain R.
return {
  {
    "R-nvim/R.nvim",
    lazy = true,
    ft = { "r", "rmd", "quarto" },
    config = function()
      local project_radian = vim.fn.getcwd() .. "/.venv/bin/radian"
      local r_app
      if vim.fn.executable(project_radian) == 1 then
        r_app = project_radian
      elseif vim.fn.executable("radian") == 1 then
        r_app = "radian"
      else
        r_app = "R"
      end

      require("r").setup({
        R_app = r_app,
        R_args = { "--quiet", "--no-save" },
        min_editor_width = 72,
        rconsole_width = 78,
        objbr_auto_start = false,
        hl_term = true,
        bracketed_paste = true,
      })
    end,
  },
}
