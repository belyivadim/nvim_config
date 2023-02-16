local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

local buffers = require("vadym.buffers")

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal mode
-- Buffer Nav
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Window Nav
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Split
keymap("n", "<leader>sv", ":vsplit<CR>", opts)
keymap("n", "<leader>sh", ":split<CR>", opts)

-- Terminal
keymap("n", "<leader>tv", ":vnew | term<CR>:set nonu<CR>a", opts)
keymap("n", "<leader>th", ":new | term<CR>:set nonu<CR>a", opts)
keymap("t", "<ESC>", "<C-\\><C-n>:bd! %<CR>", term_opts)

keymap("t", "<F7>", buffers.TerminalToggle(), term_opts) -- term toggle
keymap("n", "<F7>", buffers.TerminalToggle(), term_opts) -- term toggle

--keymap("t", "tv", "<C-\\><C-n>:vnew | term<CR>a", term_opts)
--keymap("t", "th", "<C-\\><C-n>:new | term<CR>a", term_opts)
-- Term nav
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

--":te g++ -std=c++98 -pedantic-errors -Wall -Wextra -g src/sb.cpp; ./a.out<CR>:set nonu<CR>a"
-- Run test
keymap("n", "<F5>", buffers.ComptileAndRun(), opts)

-- Buffer
keymap("n", "qq", ":bd %<CR>", term_opts)

-- Explorer
keymap("n", "<leader>e", ":Lex 30<CR>", opts)

-- Telescope
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)

-- Window resize
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Copy
keymap("n", "<C-c>", "\"+y<CR>", opts)

-- Visual
-- Copy
keymap("v", "<C-c>", "\"+y", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up/down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

