local ink_group = vim.api.nvim_create_augroup('ink configs', { clear = true })

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = { '*.ink' },
  callback = function()
    vim.cmd('LspStart grammarly')
    vim.cmd('PencilSoft')
    vim.opt_local.shiftwidth=4
  end,
  group = ink_group,
})
