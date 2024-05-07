return{
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  dependencies = {
    'rebelot/kanagawa.nvim',
  },
  config = function()
    vim.cmd([[colorscheme tokyonight-storm]])
    vim.cmd([[colorscheme kanagawa-wave]])
  end,
}
