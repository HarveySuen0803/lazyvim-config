-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- This file is automatically loaded by lazyvim.config.init

local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
    local keys = require("lazy.core.handler").handlers.keys
    ---@cast keys LazyKeysHandler
    -- do not create the keymap if a lazy keys handler exists
    if not keys.active[keys.parse({ lhs, mode = mode }).id] then
        opts = opts or {}
        opts.silent = opts.silent ~= false
        if opts.remap and not vim.g.vscode then
            opts.remap = nil
        end
        vim.keymap.set(mode, lhs, rhs, opts)
    end
end

map("n", "<C-z>", "<nop>", {})
map("n", "<C-[>", "<nop>", {})
map("n", "<C-]>", "<nop>", {})
map("n", "<C-i>", "<nop>", {})
map("n", "<C-o>", "<nop>", {})
map("n", "<C-d>", "<nop>", {})
map("n", "J", "<nop>", {})
map("n", "z", "<nop>", {})
map("v", "z", "<nop>", {})
map("n", "Z", "<nop>", {})
map("v", "Z", "<nop>", {})
map("n", "s", "<nop>", {})
map("v", "s", "<nop>", {})
map("n", "S", "<nop>", {})
map("v", "S", "<nop>", {})
map("n", "K", "<nop>", {})
map("v", "J", "<nop>", {})
map("v", "K", "<nop>", {})
map("n", "<CR>", "<nop>", {})
map("n", "x", "<nop>", {})
map("n", "q", "<nop>", {})
map("v", "q", "<nop>", {})
map("n", "Q", "<nop>", {})
map("v", "Q", "<nop>", {})
map("i", "<A-BS>", "<nop>", {})
-- map('n', 'e', '<nop>', {})
-- map('v', 'e', '<nop>', {})
map("n", "f", "<nop>", {})
map("v", "f", "<nop>", {})
map("n", "t", "<nop>", {})
map("n", "T", "<nop>", {})

-- map("n", "<C-CR>", "o<Esc>", {})
-- map("n", "<C-S-CR>", "O<Esc>", {})
-- map("i", "<C-CR>", "<Esc>o", {})
-- map("i", "<C-S-CR>", "<Esc>O", {})

map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

map("n", "<S-u>", "<C-r>", {})

map("n", "<PageDown>", "<C-d>", {})
map("n", "<PageUp>", "<C-u>", {})
map("v", "<PageDown>", "<C-d>", {})
map("v", "<PageUp>", "<C-u>", {})

map("n", "<A-Right>", "w", {})
map("n", "<A-Left>", "b", {})
map("v", "<A-Right>", "w", {})
map("v", "<A-Left>", "b", {})

map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

map("i", "<C-e>", "<Esc>A", {})
map("i", "<C-a>", "<Esc>I", {})
map("n", "<C-e>", "$", {})
map("n", "<C-a>", "^", {})
map("v", "<C-e>", "$h", {})
map("v", "<C-a>", "^", {})

map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", {})

map("n", "x", '"_d', {})
map("n", "xx", '"_dd', {})
map("n", "X", '"_D', {})
map("v", "x", '"_d', {})
map("v", "X", '"_D', {})

map("n", "gh", "<C-o>", {})
map("n", "gl", "<C-i>", {})

map("n", "W", ":w<CR>", {})
map("n", "Q", ":q<CR>", {})
map("v", "Q", ":q<CR>", {})

map("n", "zj", "<C-w>j", {})
map("n", "zh", "<C-w>h", {})
map("n", "zk", "<C-w>k", {})
map("n", "zl", "<C-w>l", {})

map("n", "zL", ":set nosplitright<CR>:vsplit<CR>", {})
map("n", "zH", ":set splitright<CR>:vsplit<CR>", {})
map("n", "zK", ":set nosplitbelow<CR>:split<CR>", {})
map("n", "zJ", ":set splitbelow<CR>:split<CR>", {})

map("v", ",", "<C-v>", {})
map("v", ".", "<S-v>", {})

map("v", "<", "<gv")
map("v", ">", ">gv")

map("n", "ya", "gg<S-v>Gy", {})
