vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- Better window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Resize windows
map("n", "<C-Up>",    ":resize +2<CR>",          { silent = true })
map("n", "<C-Down>",  ":resize -2<CR>",           { silent = true })
map("n", "<C-Left>",  ":vertical resize -2<CR>",  { silent = true })
map("n", "<C-Right>", ":vertical resize +2<CR>",  { silent = true })

-- Move lines in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
map("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

-- Keep cursor centered when scrolling
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Keep search terms centered
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Don't lose register when pasting over selection
map("x", "<leader>p", '"_dP')

-- Clear search highlight
map("n", "<Esc>", ":nohl<CR>", { silent = true })

-- Save shortcut
map({ "n", "i" }, "<C-s>", "<Cmd>w<CR>", { desc = "Save file" })

-- Quit
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })
