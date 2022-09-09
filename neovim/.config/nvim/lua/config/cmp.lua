-- Set up nvim-cmp.
local cmp_present, cmp = pcall(require, ('cmp'))
if not cmp_present then
    print('CMP is missing')
    return
end

local dev_icons_present, dev_icons = pcall(require, 'nvim-web-devicons')
local symbol_map = nil
if dev_icons_present then
    local icons = dev_icons.get_icons()

    symbol_map = {
        Text = icons['tex']['icon'],
        Snippet = icons['glb']['icon'],
        Variable = icons['json']['icon'],
        Keyword = icons['kt']['icon'],
        Function = icons['sml']['icon'],
        Module = icons['import']['icon'],
    }
end

local formatting = nil
local lspkind_present, lspnind = pcall(require, 'lspkind')
if lspkind_present then
    formatting = {
        format = lspnind.cmp_format({
            mode = "symbol_text",
            menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                spell = '[Spell]',
                nvim_lsp_document_symbol = "[LSP]",
                path = "[Path]",
                tmux = "[tmux]",
                cmdline = '[Cmd]'
            }),
            symbol_map = symbol_map
        }),
    }
end

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'ultisnips' },
        { name = 'buffer' },
        { name = 'tmux' },
        { name = 'path' },
        { name = 'nvim_lsp_document_symbol' },
        { name = 'spell', },
    }),
    formatting = formatting,
})

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_document_symbol' },
        { name = 'buffer' },
    },
    formatting = formatting,
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'cmdline' },
        { name = 'path' },
        { name = 'buffer' },
    }),
    formatting = formatting,
})

-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)
