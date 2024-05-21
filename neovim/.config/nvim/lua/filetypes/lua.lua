local ink_group = vim.api.nvim_create_augroup('ink configs', { clear = true })

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = { '*.lua' },
  callback = function()
    -- vim.cmd([[colorscheme kanagawa-wave]])
  end,
  group = ink_group,
})
