require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
}


local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap('n', '<leader>t', ':Trouble document_diagnostics<CR>', opts)
keymap('n', '<leader>T', ':Trouble workspace_diagnostics<CR>', opts)


