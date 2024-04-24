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

vim.opt.shiftwidth=2

require('lazy').setup({
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  },

  { 'honza/vim-snippets',
    dependencies = {
      'SirVer/ultisnips'
    },
  },

  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
	'neovim/nvim-lspconfig',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
        'SirVer/ultisnips',
        'quangnguyen30192/cmp-nvim-ultisnips'
    },
    config = function()
      local cmp = require'cmp'

      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'ultisnips' }, -- For ultisnips users.
        }, {
          { name = 'buffer' },
        })
      })

      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
        }, {
          { name = 'buffer' },
        })
      })

      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        }),
        matching = { disallow_symbol_nonprefix_matching = false }
      })

    end,
  },
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
  {
    'ahayworth/ink-syntax-vim',
    ft = 'ink',
  },

  {
    'dhruvasagar/vim-prosession',
    dependencies = {
    'tpope/vim-obsession',
    'nvim-telescope/telescope.nvim', 
    },
    event = 'VimEnter',
    config = function()
      require('telescope').load_extension('prosession')
      if vim.fn.has('gui_running') then
        vim.cmd('Telescope prosession')
      end
    end,
  },

  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
  }

})


vim.o.clipboard = 'unnamedplus'

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.spell = true

vim.opt.signcolumn='number'

vim.opt.scrolloff = 14

vim.opt.shiftwidth = 2
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
keymap('n', '<leader><leader>', ':Telescope builtin<CR>', remaps.opts_silent)

if vim.fn.has('gui_running') then
  -- vim.opt.guifont = 'Fira\\ Code:h12'
  vim.cmd('set guifont=Fira\\ Code:h12')
end

