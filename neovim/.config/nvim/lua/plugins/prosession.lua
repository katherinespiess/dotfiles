return {
  "dhruvasagar/vim-prosession",
  dependencies = {
    "tpope/vim-obsession",
    'goolord/alpha-nvim',
  },
  config = function()
    vim.g.prosession_dir = vim.env.HOME .. '/.config/nvim/temp/session'
    vim.g.prosession_on_startup = 1
  end,
  cmd = { 'Prosession', 'Obsession', 'Telescope prosession', },
  event = 'VeryLazy',
}
