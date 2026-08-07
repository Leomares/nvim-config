# Neovim configuration

A minimal, personal Neovim configuration using the built-in `vim.pack` plugin
manager (Neovim 0.12+). It was migrated from `lazy.nvim` so the setup stays
explicit and dependency-free.

## Requirements

- [Neovim](https://neovim.io/) **0.12** or later (tested on 0.12.3)
- [Git](https://git-scm.com/) for cloning plugins
- [ripgrep](https://github.com/BurntSushi/ripgrep) for Telescope live grep
- `make` is optional but required to build `telescope-fzf-native.nvim`
- [R](https://www.r-project.org/) / [radian](https://github.com/randy3k/radian)
  for R support (radian is searched in `.venv/bin/radian`, then globally)
- Language-server binaries that Mason does not install automatically (e.g.
  `ruff`, `pyright`, `lua-language-server`) or a working Mason setup

## First install

Plugins are installed automatically on the first launch:

```bash
nvim
```

`vim.pack` clones plugins into Neovim's data directory:

```
~/.local/share/nvim/site/pack/core/opt/
```

(or the equivalent `stdpath("data")` on your platform).

Plugin revisions are pinned in `init.lua` via the `version` field and recorded
in `nvim-pack-lock.json`.

## Updating packages

Open Neovim and run:

```vim
:lua vim.pack.update()
```

Confirm pending changes with `:w`, or discard with `:q`.

To align all plugins with the lockfile (e.g. after pulling on another machine):

```vim
:lua vim.pack.update(nil, { target = "lockfile" })
```

Removed plugins can be deleted with `vim.pack.del()`; see `:h vim.pack.del()`.

## Manual post-update steps

Some plugins need a manual step after install or update because `vim.pack` does
not run arbitrary commands on every startup:

- **nvim-treesitter**: run `:TSUpdate` to ensure parsers are current.
- **mason.nvim**: run `:MasonUpdate` to refresh the registry.
- **telescope-fzf-native.nvim**: if `make` was available when the plugin was
  added, it is built automatically via a `PackChanged` hook. Otherwise, open a
  terminal in the plugin directory and run `make`.

## Plugin list

Core libraries:

- `plenary.nvim`
- `nui.nvim`
- `nvim-web-devicons`
- `friendly-snippets`

Primary plugins:

- `nvim-treesitter`
- `blink.cmp` + `blink-cmp-copilot`
- `catppuccin`
- `telescope.nvim` (+ `telescope-fzf-native.nvim` when `make` exists)
- `neo-tree.nvim`
- `harpoon` (harpoon2 branch)
- `mason.nvim`, `mason-lspconfig.nvim`, `nvim-lspconfig`
- `R.nvim`
- `copilot.lua`

## Mappings

See `lua/core/keymaps.lua` for general mappings and the individual plugin files
under `lua/config/plugins/` for plugin-specific mappings. Notable mappings:

- `<leader>e` — toggle Neo-tree
- `<leader>o` — reveal current file in Neo-tree
- `<leader>ff`, `<leader>fg`, `<leader>fb`, `<leader>fh`, `<leader>fr`, `<leader>fd` — Telescope
- `<leader>a`, `<C-e>`, `<leader>1..4`, `[h`, `]h` — Harpoon
- `gd`, `gr`, `K`, `<leader>ca`, `<leader>rn`, etc. — LSP

## Notes on reproducibility

`vim.pack` accepts a commit hash in the `version` field, so every plugin in
`init.lua` is pinned to the exact revision that was previously recorded in
`lazy-lock.json`. The first Neovim start writes a new `nvim-pack-lock.json`
with those pinned revisions.

