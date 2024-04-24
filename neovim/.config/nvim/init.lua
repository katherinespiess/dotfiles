vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

if (string.find(vim.fn.getcwd(), "bin")) then
  vim.cmd("cd ~") -- this is a work around that should be fixed
end



--Lazy plugging manager
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup(require('plugins'))

require('flags')
