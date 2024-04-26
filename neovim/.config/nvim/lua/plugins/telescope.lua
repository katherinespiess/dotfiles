return {
  'nvim-telescope/telescope.nvim', tag = '0.1.6',
  event = 'VeryLazy',
  cmd = 'Telescope',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    vim.keymap.set('n', '<leader>b', '<CMD>Telescope buffers<CR>',  { noremap = true, silent = true, desc = 'Find buffer'})
    vim.keymap.set('n', '<leader>i', '<CMD>Telescope builtin<CR>',  { noremap = true, silent = true, desc = 'Finders'})
    vim.keymap.set('n', '<leader>f', '<CMD>Telescope oldfiles<CR>', { noremap = true, silent = true, desc = 'Find Files'})
    vim.keymap.set('n', '<leader><leader>', '<CMD>Telescope commands<CR>', { noremap = true, silent = true, desc = 'Find Command'})
  end
}
