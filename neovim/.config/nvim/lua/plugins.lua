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
require('lazy').setup({
  require('plugins.tokyonight'),
  require('plugins.mason'),
  require('plugins.alpha'),
  require('plugins.lualine'),
  require('plugins.cmp'),
  require('plugins.git-blame'),
  require('plugins.treesitter'),
  require('plugins.nvimtree'),
  require('plugins.oil'),
  require('plugins.vimtex'),
  require('plugins.prosession'),
  require('plugins.telescope'),
  require('plugins.snippets'),
  require('plugins.autopairs'),
  require('plugins.trouble'),
  require('plugins.obsidian'),
  require('plugins.gitgutter'),
  require('plugins.which'),
  require('plugins.pencil'),
  require('plugins.copypath'),
  require('plugins.surround'),
  { 'yorik1984/newpaper.nvim',         event = 'VeryLazy', },
  { 'airblade/vim-rooter',             event = 'VeryLazy', },
  { 'kana/vim-textobj-user',           event = 'VeryLazy', },
  { 'michaeljsmith/vim-indent-object', event = 'VeryLazy', },
  { 'tomtom/tcomment_vim',             event = 'VeryLazy', },
  { 'vim-scripts/ReplaceWithRegister', event = 'VeryLazy', },
  { 'kana/vim-textobj-entire',         event = 'VeryLazy', dependencies = 'kana/vim-textobj-user', },
  { 'glts/vim-textobj-comment',        event = 'VeryLazy', dependencies = 'kana/vim-textobj-user', },
  { 'tpope/vim-fugitive',       cmd = 'Git', },
  { 'ahayworth/ink-syntax-vim', ft = 'ink', },


})
