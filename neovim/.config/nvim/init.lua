local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.opt.shiftwidth=2

require("lazy").setup({
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
	'neovim/nvim-lspconfig',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
  },


  -- Additional Objects
  {
    'kana/vim-textobj-user',
    event = 'VimEnter',
  }, --TODO change for a lua one
  -- Indentation
  {
    'michaeljsmith/vim-indent-object',
    dependencies = 'nvim-lspconfig',
  }, --TODO change for a lua one
  -- entire file object:
  {
    'kana/vim-textobj-entire',
    dependencies = 'kana/vim-textobj-user',
    event = 'VimEnter',
  },
  {
    'glts/vim-textobj-comment',
    dependencies = 'kana/vim-textobj-user',
    event = 'VimEnter',
  }, --TODO change for a lua one
  -- Comment as object:
  { 'tomtom/tcomment_vim', after = 'nvim-lspconfig' },
  {
    'preservim/vim-pencil',
    cmd = { 'Pencil', 'PencilSoft', 'PencilHard', 'PencilToggle' },
  }, 
  {
    'tpope/vim-surround',
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
  {
    'tpope/vim-fugitive',
    cmd = { 'Git' },
  },
  {'ahayworth/ink-syntax-vim'},

  'tpope/vim-obsession',
  'dhruvasagar/vim-prosession',
})


vim.o.clipboard = 'unnamedplus'

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.spell = true

vim.opt.signcolumn='number'

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

vim.opt.completeopt= { 'menu', 'menuone', 'noselect', }

vim.opt.conceallevel = 1
vim.opt.wrap = false

vim.cmd[[let g:pencil#conceallevel = 0]]

vim.g.prosession_dir = vim.env.HOME .. '/.config/nvim/temp/session'
vim.g.rooter_patterns = {'.root', '.git', 'Makefile'}

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local remaps = {}
remaps.opts_silent = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap('n', 'zn', ']s', remaps.opts_silent)
keymap('n', 'zN', '[s', remaps.opts_silent)
keymap('n', 'zf', 'z=', remaps.opts_silent)
keymap('n', '<leader>n', ':bnext<CR>', remaps.opts_silent)
keymap('n', '<leader>p', ':bprevious<CR>', remaps.opts_silent)
keymap('n', '<leader>a', ':buf #<CR>', remaps.opts_silent)

