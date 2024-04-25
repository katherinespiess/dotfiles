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
  {
    'goolord/alpha-nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'nvim-lua/plenary.nvim'
    },
    lazy = false,
    config = function ()
      require'alpha'.setup(require('beta').config)
    end
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup()
    end
  },

  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require("nvim-tree").setup()
    end
  },

  { 'honza/vim-snippets',
    dependencies = {
      'SirVer/ultisnips'
    },
  },

  require('plugins.cmp'),
  require('plugins.git-blame'),
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function () 
      local configs = require('nvim-treesitter.configs')

      configs.setup({
          ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query', 'elixir', 'heex', 'javascript', 'html' },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
  },

  { 'airblade/vim-rooter', event = 'VeryLazy', },

  -- Additional Objects and actions
  { 'kana/vim-textobj-user', event = 'VeryLazy', }, 
  { 'michaeljsmith/vim-indent-object', dependencies = 'williamboman/mason.nvim' },
  { 'kana/vim-textobj-entire', dependencies = 'kana/vim-textobj-user', event = 'VeryLazy', },
  { 'glts/vim-textobj-comment', dependencies = 'kana/vim-textobj-user', event = 'VeryLazy', },
  { 'tomtom/tcomment_vim', event = 'VeryLazy'},
  { 'vim-scripts/ReplaceWithRegister', event = 'VeryLazy'},
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  }, 

  {
    'lervag/vimtex',
    config = function()
      vim.cmd [[syntax enable]]
      vim.g.syntax = true
      vim.g.vimtex_view_general_viewer = 'zathura'
      vim.g.vimtex_view_method = 'zathura'
      vim.g.tex_flavor = 'latex'
      vim.g.vimtex_quickfix_mode = 0
      vim.g.tex_conceal = 'abdmg'
    end,
    ft = { 'tex', },
  },
  { 'ahayworth/ink-syntax-vim', ft = 'ink', },
  { 'tpope/vim-fugitive', cmd = { 'Git' }, },
  {
    'airblade/vim-gitgutter',
    event = 'VeryLazy',
    config = function()
      vim.g.gitgutter_map_keys = 0
    end,
  },

  {
    "dhruvasagar/vim-prosession",
    dependencies = {
      "tpope/vim-obsession",
      'goolord/alpha-nvim',
    },
    config = function()
      vim.g.prosession_dir = vim.env.HOME .. '/.config/nvim/temp/session'
      vim.g.prosession_on_startup = 1
      require('telescope').load_extension('prosession')
    end,
    cmd = { 'Prosession', 'Obsession', 'Telescope prosession', },
    event = 'VeryLazy',
  },

  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    event = 'VeryLazy',
    cmd = 'Telescope',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },


})
