vim.opt.shiftwidth=2
vim.o.clipboard = 'unnamedplus'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.spell = true
vim.opt.scrolloff = 14
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.backup = true
vim.opt.undofile = true
vim.opt.undolevels = 3000
vim.opt.backupdir = vim.env.HOME .. '/.config/nvim/temp/backup/'
vim.opt.directory = vim.env.HOME .. '/.config/nvim/temp/swap/'
vim.opt.undodir = vim.env.HOME .. '/.config/nvim/temp/undo/'
vim.opt.conceallevel = 1
vim.opt.wrap = false

vim.cmd[[let g:pencil#conceallevel = 0]]

-- vim.g.prosession_dir = vim.env.HOME .. '/.config/nvim/temp/session'
vim.g.rooter_patterns = {'.root', '.git', 'Makefile'}

local remaps = {}
remaps.opts_silent = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap('n', 'zn', ']s', remaps.opts_silent)
keymap('n', 'zN', '[s', remaps.opts_silent)
keymap('n', 'zf', 'z=', remaps.opts_silent)
keymap('n', '<leader>n', ':bnext<CR>', remaps.opts_silent)
keymap('n', '<leader>p', ':bprevious<CR>', remaps.opts_silent)
keymap('n', '<leader>a', ':buf #<CR>', remaps.opts_silent)
keymap('n', '<leader>t', ':NvimTreeFocus<CR>:NvimTreeRefresh<CR>', remaps.opts_silent)
keymap('n', '<leader>h', ':AlphaRedraw<CR>:Alpha<CR>', remaps.opts_silent)
keymap('n', '<leader>w', ':WhichKey<CR>', remaps.opts_silent)
keymap('n', '<leader>f', ':Telescope builtin<CR>', remaps.opts_silent)
keymap('n', '<leader>b', ':Telescope buffers<CR>', remaps.opts_silent)

vim.cmd('set guifont=Fira\\ Code:h12')
