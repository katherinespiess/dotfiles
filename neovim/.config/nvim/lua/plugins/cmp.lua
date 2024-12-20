return {
  'hrsh7th/nvim-cmp',
  event = { 'InsertEnter', 'VeryLazy' },
  dependencies = {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'SirVer/ultisnips',
    'quangnguyen30192/cmp-nvim-ultisnips',
    'f3fora/cmp-spell',
    'zbirenbaum/copilot.lua',
    'zbirenbaum/copilot-cmp',
  },
  config = function()
    local cmp = require 'cmp'
    cmp.setup({
      {
        name = 'spell',
        option = {
          keep_all_entries = false,
          enable_in_context = function()
            -- return require('cmp.config.context').in_treesitter_capture('spell')
            return true
          end,
        },
      },
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
        { name = 'copilot',  group_index = 1 },
        { name = 'nvim_lsp',  group_index = 2 },
        { name = 'ultisnips',  group_index = 2 }, -- For ultisnips users.
        { name = 'spell',  group_index = 2 },
      }, {
        { name = 'buffer', group_index = 3 },
      })
    })

    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'git', group_index = 2 }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
      }, {
        { name = 'buffer', group_index = 2 },
      })
    })

    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer', group_index = 2 }
      }
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path', group_index = 2 }
      }, {
        { name = 'cmdline', group_index = 2 }
      }),
      matching = { disallow_symbol_nonprefix_matching = false }
    })
  end,
}
