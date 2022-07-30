vim.g.mapleader = ' '

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

keymap('n', '<leader>n', ':bnext<CR>', opts)
keymap('n', '<leader>p', ':bprevious<CR>', opts)
keymap('n', '<leader>a', ':buf #<CR>', opts)
keymap('n', '<leader>d', ':bdelete<CR>', opts)
keymap('n', '<leader>D', ':bdelete!<CR>', opts)
keymap('n', '<leader>x', ':q<CR>', opts)
keymap('n', '<leader>X', ':q!<CR>', opts)
keymap('n', '<leader>b', ':buffers!<cr>:buf', opts)

keymap('n', '<leader>sp', ':setlocal spell!<cr>', opts)

keymap('n', '/', '/\\v', opts)
keymap('v', '/', '/\\v', opts)
keymap('n', '?', '?\\v', opts)
keymap('v', '?', '?\\v', opts)


