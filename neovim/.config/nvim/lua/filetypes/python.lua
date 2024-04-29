
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = { '*.python' },
  callback = function()
    vim.cmd('LspStart pylsp')
    vim.opt_local.shiftwidth=2
  end,
  group = ink_group,
})
