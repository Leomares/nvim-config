require("core.options")
require("core.keymaps")

-- vim.pack stores plugin clones under Neovim's data directory (not in this repo).
-- See `:h vim.pack-directory` and the README for update/maintenance commands.

-- Post-install/update hooks. These run only when a plugin is installed or
-- updated by vim.pack, not on every startup.
vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name = ev.data.spec.name
    local kind = ev.data.kind
    if kind ~= "install" and kind ~= "update" then
      return
    end

    if name == "nvim-treesitter" then
      vim.cmd("TSUpdate")
    elseif name == "mason.nvim" then
      vim.cmd("MasonUpdate")
    elseif name == "telescope-fzf-native.nvim" then
      vim.system({ "make" }, { cwd = ev.data.path }):wait()
    end
  end,
})

local core_libs = {
  { src = "https://github.com/nvim-lua/plenary.nvim", version = "74b06c6c75e4eeb3108ec01852001636d85a932b" },
  { src = "https://github.com/MunifTanjim/nui.nvim", version = "de740991c12411b663994b2860f1a4fd0937c130" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons", version = "dfbfaa967a6f7ec50789bead7ef87e336c1fa63c" },
  { src = "https://github.com/rafamadriz/friendly-snippets", version = "6cd7280adead7f586db6fccbd15d2cac7e2188b9" },
}

local primary_plugins = {
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "4916d6592ede8c07973490d9322f187e07dfefac" },
  { src = "https://github.com/saghen/blink.cmp", version = "78336bc89ee5365633bcf754d93df01678b5c08f" },
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin", version = "0303a7208dba448c459767486a38a6ec05c4216b" },
  { src = "https://github.com/nvim-telescope/telescope.nvim", version = "7d324792b7943e4aa16ad007212e6acc6f9fe335" },
  { src = "https://github.com/nvim-neo-tree/neo-tree.nvim", version = "ebd66767191714e008ce73b769518a763ff31bdc" },
  { src = "https://github.com/ThePrimeagen/harpoon", name = "harpoon", version = "87b1a3506211538f460786c23f98ec63ad9af4e5" },
  { src = "https://github.com/mason-org/mason.nvim", version = "16ba83bfc8a25f52bb545134f5bee082b195c460" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim", version = "0a695750d747db1e7e70bcf0267ef8951c95fc83" },
  { src = "https://github.com/neovim/nvim-lspconfig", version = "229b79051b380377664edc4cbd534930154921a1" },
  { src = "https://github.com/R-nvim/R.nvim", name = "R.nvim", version = "dbe4786b4d10b497d2241c18b23cd18564734463" },
  { src = "https://github.com/zbirenbaum/copilot.lua", version = "1d457ad5f267b8ef855a6b8b3fe152403cb00947" },
  { src = "https://github.com/giuxtaposition/blink-cmp-copilot", version = "439cff78780c033aa23cf061d7315314b347e3c1" },
}

vim.pack.add(core_libs)
vim.pack.add(primary_plugins)

if vim.fn.executable("make") == 1 then
  vim.pack.add({
    { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim", version = "b25b749b9db64d375d782094e2b9dce53ad53a40" },
  })
end

require("config.plugins.theme")
require("config.plugins.treesitter")
require("config.plugins.telescope")
require("config.plugins.explorer")
require("config.plugins.harpoon")
require("config.plugins.completion")
require("config.plugins.lsp")
require("config.plugins.r")
