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

  { 'airblade/vim-rooter', event = 'VeryLazy', },
  { 'kana/vim-textobj-user', event = 'VeryLazy', }, 
  { 'michaeljsmith/vim-indent-object' },
  { 'kana/vim-textobj-entire', dependencies = 'kana/vim-textobj-user', event = 'VeryLazy', },
  { 'glts/vim-textobj-comment', dependencies = 'kana/vim-textobj-user', event = 'VeryLazy', },
  { 'tomtom/tcomment_vim', event = 'VeryLazy'},
  { 'vim-scripts/ReplaceWithRegister', event = 'VeryLazy'},
  { "kylechui/nvim-surround", event = "VeryLazy", config = function() require("nvim-surround").setup({}) end },
  { 'ahayworth/ink-syntax-vim', ft = 'ink', },
  { 'tpope/vim-fugitive', cmd = { 'Git' }, },
  { 'airblade/vim-gitgutter', event = 'VeryLazy', config = function() vim.g.gitgutter_map_keys = 0 end, },


  require('plugins.which'),


})
