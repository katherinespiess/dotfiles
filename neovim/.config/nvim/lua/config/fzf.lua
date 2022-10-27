require("fzf-lua").setup({
    lsp = {
        -- make lsp requests synchronous so they work with null-ls
        async_or_timeout = 3000,
    },
})

local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap
keymap('n', '<leader><leader>', ':FzfLua builtin<CR>', opts)
keymap('n', '<leader>f', ':FzfLua git_files<CR>', opts)
keymap('n', '<leader>F', ':FzfLua files<CR>', opts)
keymap('n', '<leader>b', ':FzfLua buffers<CR>', opts)
keymap('n', '<leader>s', ':FzfLua lsp_document_symbols<CR>', opts)
keymap('n', '<leader>S', ':FzfLua lsp_workspace_symbols<CR>', opts)
keymap('n', 'gd', ':FzfLua lsp_definitions<CR>', opts)
keymap('n', 'gD', ':FzfLua lsp_declarations<CR>', opts)
keymap('n', 'gr', ':FzfLua lsp_references<CR>', opts)
