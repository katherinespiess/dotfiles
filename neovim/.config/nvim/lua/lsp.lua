local lsp = {}

lsp.bufopts = function(bufnr) return { noremap = true, silent = true, buffer = bufnr } end

lsp.on_attach = function(_, bufnr)

    -- Enable completion triggered by <c-x><c-o>
    -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = lsp.bufopts(bufnr)
    -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', function() vim.cmd [[CodeActionMenu]] end, bufopts)
    vim.keymap.set('n', 'gR', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '==', vim.lsp.buf.formatting, bufopts)

    local invalid_resource = function(resource)
        return function()
            print('resource ' .. resource .. ' seems to be unavailable to this language')
        end
    end

    --TODO check to add it to other languages, python would really benefit from it
    vim.keymap.set('n', 'crv', invalid_resource('extract_variable'), bufopts)
    vim.keymap.set('v', 'crv', invalid_resource('extract_variable'), bufopts)
    vim.keymap.set('n', 'crc', invalid_resource('extract_constant'), bufopts)
    vim.keymap.set('v', 'crc', invalid_resource('extract_constant'), bufopts)
    vim.keymap.set('v', 'crm', invalid_resource('extract_method'), bufopts)
    vim.keymap.set('n', 'crm', invalid_resource('extract_method'), bufopts)
end

-- Set up lspconfig.
lsp.setup = function()

    local ok, installer = pcall(require, "nvim-lsp-installer")
    if not ok then
        return
    end
    installer.setup {
        automatic_installation = true,
    }

    local ok2, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
    if not ok2 then
        return
    end

    local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

    local lsp_table = {
        sumneko_lua = {
            Lua = {
                diagnostics = { globals = { 'vim', 'require' }, },
            },
        },
        ltex = {},
        texlab = {},
        lemminx = {},
        pyright = {},
    }



    -- Mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
    vim.keymap.set('n', '<space>k', vim.diagnostic.open_float, opts)


    local lspconfig = require('lspconfig');

    for lsp_server_name, settings in pairs(lsp_table) do
        lspconfig[lsp_server_name].setup({
            on_attach = lsp.on_attach,
            capabilities = capabilities,
            settings = settings,
        })
    end

end

return lsp
