-- R.nvim: R language support with radian REPL
-- Looks for radian in .venv/bin/radian (project venv) before falling back to system radian.
return {
  {
    "R-nvim/R.nvim",
    lazy = false,
    config = function()
      local radian_path

      -- Project venv radian (e.g. renv/radian or .venv/bin/radian)
      local project_radian = vim.fn.getcwd() .. "/.venv/bin/radian"
      if vim.fn.executable(project_radian) == 1 then
        radian_path = project_radian
      elseif vim.fn.executable("radian") == 1 then
        radian_path = "radian"
      end

      require("r").setup({
        R_app = radian_path or "R",
        R_cmd = radian_path and { radian_path } or { "R", "--no-save" },
        R_args = {},
        hook = {
          after_config = function()
            -- Re-check on every new R start in case cwd changed
            local p = vim.fn.getcwd() .. "/.venv/bin/radian"
            if vim.fn.executable(p) == 1 then
              vim.g.R_app = p
            end
          end,
        },
        min_editor_width = 72,
        rconsole_width = 78,
        objbr_auto_start = false,
        hl_term = true,
        bracketed_paste = true,
      })
    end,
  },
  {
    "R-nvim/cmp-r",
    dependencies = { "R-nvim/R.nvim" },
    ft = { "r", "rmd", "quarto" },
    config = function()
      -- registers R-specific completion source for blink if available
      -- falls back to buffer completions otherwise
      local ok, cmp_r = pcall(require, "cmp_r")
      if ok then cmp_r.setup() end
    end,
  },
}
