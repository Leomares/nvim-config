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
