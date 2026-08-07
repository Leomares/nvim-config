local telescope = require("telescope")
local actions = require("telescope.actions")

vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help tags" })
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })
vim.keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", { desc = "Diagnostics" })

telescope.setup({
  defaults = {
    path_display = { "truncate" },
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
      },
    },
  },
})

local fzf_added = false
for _, plugin in ipairs(vim.pack.get() or {}) do
  if plugin.spec and plugin.spec.name == "telescope-fzf-native.nvim" and plugin.active then
    fzf_added = true
    break
  end
end

if fzf_added then
  local ok, err = pcall(telescope.load_extension, "fzf")
  if not ok then
    vim.notify(
      "telescope-fzf-native.nvim is installed but could not be loaded: "
        .. tostring(err)
        .. "\nBuild it with `make` in its install directory.",
      vim.log.levels.WARN
    )
  end
end
