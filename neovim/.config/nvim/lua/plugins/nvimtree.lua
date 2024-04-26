return {
  'nvim-tree/nvim-tree.lua',
  event = 'VeryLazy',
  config = function()
    require("nvim-tree").setup()

    vim.keymap.set('n', '<leader>t', '<CMD>NvimTreeFocus<CR>', { noremap = true, silent = true, desc = 'Open side tree'})
  end
}
