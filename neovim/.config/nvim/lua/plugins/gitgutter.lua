return {
  'airblade/vim-gitgutter',
  event = 'VeryLazy',
  config = function()
    vim.g.gitgutter_map_keys = 0
  end,
  cond = function()
    return (vim.fn.has('win64') <= 0)
  end,
}
