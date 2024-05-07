return {
  "folke/which-key.nvim",
  cmd = 'WhichKey',
  config = function()
    vim.api.nvim_set_keymap('n', '<leader>w', ':WhichKey<CR>', { noremap = true, silent = true })
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    local wk = require("which-key")
    wk.register(mappings, opts)
  end
}
