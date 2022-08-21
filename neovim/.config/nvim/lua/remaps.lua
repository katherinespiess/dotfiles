vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local keymap = vim.api.nvim_set_keymap
local opts_silent = { noremap = true, silent = true }
local opts = { noremap = true }

keymap('n', '<leader>n', ':bnext<CR>', opts_silent)
keymap('n', '<leader>p', ':bprevious<CR>', opts_silent)
keymap('n', '<leader>a', ':buf #<CR>', opts_silent)
keymap('n', '<leader>d', ':bdelete<CR>', opts_silent)
keymap('n', '<leader>D', ':bdelete!<CR>', opts_silent)
keymap('n', '<leader>x', ':q<CR>', opts_silent)
keymap('n', '<leader>X', ':q!<CR>', opts_silent)
keymap('n', '<leader>B', ':buffers!<cr>:buf', opts_silent)

keymap('n', '<leader>sp', ':setlocal spell!<cr>', opts_silent)

keymap('n', '/', '/\\v', opts)
keymap('v', '/', '/\\v', opts)
keymap('n', '?', '?\\v', opts)
keymap('v', '?', '?\\v', opts)


keymap('n', '<leader><leader>', ':FzfLua builtin<CR>', opts_silent)
keymap('n', '<leader>f', ':FzfLua git_files<CR>', opts_silent)
keymap('n', '<leader>b', ':FzfLua buffers<CR>', opts_silent)


keymap('n', '<leader>g', ':Git<cr>', opts_silent)
