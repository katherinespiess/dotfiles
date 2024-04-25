
return {
  'williamboman/mason.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    'williamboman/mason-lspconfig.nvim',
  },
  event = 'VeryLazy',
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        'lua_ls',
      }
    })
    require('lspconfig').lua_ls.setup({})
  end,
}
