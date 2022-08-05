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
vim.opt.backupdir = os.getenv('HOME') .. '/.config/nvim/temp/backup/'
vim.opt.directory = os.getenv('HOME') .. '/.config/nvim/temp/swap/'
vim.opt.undodir = os.getenv('HOME') .. '/.config/nvim/temp/undo/'


vim.g.prosession_dir = '~/.config/nvim/temp/session'
