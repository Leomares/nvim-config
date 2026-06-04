Instructions to create the nvim config

Basic directions:
- bare bones logic, dont abstract some problem into multiple function calls to test the environment. fail fast
- file structure separating init.lua from keymaps, per-plugin config, theme related config, etc
- use lazy package manager 
- Id like to use with python, r, and rarely js/ts

Must have:
- treesitter, telescope
- harpoon2 (primeagen plugin to switch easily between buffers)
- fuzzy finder for files/ripgrep for text inside them or equivalent 
- mason to manipulate lsp isntallations
- keybinding to open the explorer

Nice to have:
- Use R with the radian REPL installed inside the project virtual environment
- github copilot autocompletion

