return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = 'VeryLazy',
  config = function () 
    local configs = require('nvim-treesitter.configs')

    configs.setup({
        ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query', 'elixir', 'heex', 'javascript', 'html', 'sql' },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },  
      })
  end
}
