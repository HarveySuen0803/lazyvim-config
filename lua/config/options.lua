-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

vim.g.encoding = "UTF-8"
vim.g.fileencoding = "utf-8"

vim.o.number = true
vim.o.relativenumber = false

vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.autoread = true
vim.o.autochdir = true

vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.shiftround = true
vim.o.smarttab = true

vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.autowrite = true -- Enable auto write

vim.o.clipboard = "unnamedplus" -- Sync with system clipboard

vim.o.completeopt = "menu,menuone,noselect"

vim.o.conceallevel = 3

vim.o.confirm = true

vim.o.cursorline = false

vim.o.cursorlineopt = "number"

vim.o.updatetime = 100

vim.o.mouse = "a"

vim.o.scrolloff = 20
vim.o.sidescrolloff = 20

vim.o.hidden = true

vim.o.wildmenu = true

vim.o.pumheight = 10

vim.o.syntax = "on"

vim.o.eb = false

vim.o.laststatus = 2
vim.o.showtabline = 2

vim.o.signcolumn = "no"
