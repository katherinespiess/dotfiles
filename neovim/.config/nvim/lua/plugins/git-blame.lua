return {
  'f-person/git-blame.nvim',
  event = 'VeryLazy',
  cond = function()
    return (vim.fn.has('win64') <= 0)
  end,
}
