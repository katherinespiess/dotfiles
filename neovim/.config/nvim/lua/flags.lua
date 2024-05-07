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
vim.opt.undolevels = 300
vim.opt.backupdir = vim.env.HOME .. '/.config/nvim/temp/backup/'
vim.opt.directory = vim.env.HOME .. '/.config/nvim/temp/swap/'
vim.opt.undodir = vim.env.HOME .. '/.config/nvim/temp/undo/'
vim.opt.conceallevel = 1
vim.opt.wrap = false

vim.cmd('set guifont=Fira\\ Code:h12')


vim.g.prosession_dir = vim.env.HOME .. '/.config/nvim/temp/session'
vim.g.rooter_patterns = {'.root', '.git', 'Makefile'}

vim.api.nvim_set_keymap('n', '<leader>n', '<CMD>bnext<CR>', { noremap = true, silent = true, desc = 'Go to next buffer'})
vim.api.nvim_set_keymap('n', '<leader>p', '<CMD>bprevious<CR>', { noremap = true, silent = true, desc = 'Go to previous buffer' })
vim.api.nvim_set_keymap('n', '<leader>a', '<CMD>buf #<CR>', { noremap = true, silent = true, desc = 'Go to alternative buffer' })
vim.api.nvim_set_keymap('n', '<leader>d', '<CMD>bdelete<CR>', { noremap = true, silent = true, desc = 'Delete current buffer' })

vim.api.nvim_set_keymap('n', '<leader>', '<CMD>WhichKey \\ <CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<localleader>', '<CMD>WhichKey <localleader><CR>', { noremap = true, silent = true })
