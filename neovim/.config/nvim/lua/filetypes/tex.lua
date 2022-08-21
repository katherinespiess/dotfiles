-- Settings for filetypes:

-- vim.api.nvim_create_autocmd('tex')
-- vim.api.nvim_create_augroup('tex', { clear = true })
-- vim.api.nvim_create_autocmd('Filetype', {
--     group = 'tex',
--     pattern = { 'tex', 'latex' },
--     callback = function()
--         vim.cmd[[colorscheme dracula]]
--         vim.cmd[[PencilSoft]]
--     end,
-- })

vim.cmd([[
    augroup lsp_document_highlight
        autocmd!
        autocmd FileType tex colorscheme dracula
        autocmd FileType tex PencilSoft
    augroup END
]])
