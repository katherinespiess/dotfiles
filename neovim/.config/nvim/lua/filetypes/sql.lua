vim.api.nvim_create_autocmd('BufEnter', {
  pattern = { '*.prc', '*.trg', '*.ut', '*.fn', '*.vw', '*.pkg', '*.pck', },
  callback = function()
    vim.cmd('set filetype=sql')
  end,
  group = ink_group,
})
