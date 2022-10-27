vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local remaps = {}

remaps.opts_silent = { noremap = true, silent = true }


remaps.setup = function()
    local keymap = vim.api.nvim_set_keymap
    keymap('n', '<leader>n', ':bnext<CR>', remaps.opts_silent)
    keymap('n', '<leader>p', ':bprevious<CR>', remaps.opts_silent)
    keymap('n', '<leader>a', ':buf #<CR>', remaps.opts_silent)
    keymap('n', '<leader>d', ':bdelete<CR>', remaps.opts_silent)
    keymap('n', '<leader>D', ':bdelete!<CR>', remaps.opts_silent)
    keymap('n', '<leader>x', ':q<CR>', remaps.opts_silent)
    keymap('n', '<leader>X', ':q!<CR>', remaps.opts_silent)
    keymap('n', '<leader>B', ':buffers!<cr>:buf', remaps.opts_silent)

    keymap('n', '<leader>g', ':Git<cr>', remaps.opts_silent)
end

return remaps
