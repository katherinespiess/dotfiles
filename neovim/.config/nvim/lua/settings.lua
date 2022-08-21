vim.o.clipboard = 'unnamedplus'

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 14

vim.opt.shiftwidth = 4
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

vim.g.prosession_dir = vim.env.HOME .. '/.config/nvim/temp/session'

vim.g.rooter_patterns = {'.git', 'Makefile'}

vim.cmd[[colorscheme tokyonight]]
