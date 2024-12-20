vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local bufmap = function(mode, lhs, rhs, desc)
      local opts = { buffer = event.buf, desc = desc }
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- You can find details of these function in the help page
    -- see for example, :help vim.lsp.buf.hover()

    -- Trigger code completion
    -- bufmap('i', '<C-Space>', '<C-x><C-o>')

    -- Display documentation of the symbol under the cursor
    bufmap('n', 'K', vim.lsp.buf.hover, 'Hover')
    bufmap('n', '<localleader>K', vim.lsp.buf.hover, 'Hover')

    -- Jump to the definition
    bufmap('n', '<localleader>d', vim.lsp.buf.definition, 'definition')

    -- Jump to declaration
    bufmap('n', '<localleader>D', vim.lsp.buf.declaration, 'declaraan')

    -- Lists all the implementations for the symbol under the cursor
    bufmap('n', '<localleader>i', vim.lsp.buf.implementation, 'implementation')

    -- Jumps to the definition of the type symbol
    bufmap('n', '<localleader>t', vim.lsp.buf.type_definition, 'type definition')

    -- Lists all the references
    bufmap('n', '<localleader>r', vim.lsp.buf.references, 'references')

    -- Displays a function's signature information
    bufmap('n', '<localleader>k', vim.lsp.buf.signature_help, 'help')

    -- Renames all references to the symbol under the cursor
    bufmap('n', '<localleader>c', vim.lsp.buf.rename, 'rename')

    -- Format current file
    bufmap('n', '<localleader>f', vim.lsp.buf.format, 'format')

    -- Selects a code action available at the current cursor position
    bufmap('n', '<localleader><localleader>', function() vim.cmd("CodeActionMenu") end, 'code action')
  end
})

return {
  'williamboman/mason.nvim',
  dependencies = {
    { 'neovim/nvim-lspconfig',             cond = true, },
    { 'williamboman/mason-lspconfig.nvim', cond = true, },
    { "mfussenegger/nvim-lint",            cond = true, },
    { "rshkarin/mason-nvim-lint",          cond = true, },
  },
  event = 'VeryLazy',
  cond = function()
    return true
  end,
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = vim.fn.has('win64') <= 0 and {
        'lua_ls',
        'ltex',
        'texlab',
        'pylsp',
        'clangd',
      } or {
        'lua_ls',
        'grammarly',
      },
    })

    require('lspconfig').lua_ls.setup({})
    if (vim.fn.has('win64') <= 0) then
      require('lspconfig').ltex.setup({})
      require('lspconfig').texlab.setup({})
      require('lspconfig').clangd.setup({})
      require('lspconfig').pylsp.setup({
        settings = {
          pylsp = {
            plugins = {
              -- formatter options
              black = { enabled = true },
              autopep8 = { enabled = false },
              yapf = { enabled = false },
              -- linter options
              pylint = { enabled = true, executable = "pylint" },
              pyflakes = { enabled = false },
              pycodestyle = { enabled = false },
              -- type checker
              pylsp_mypy = { enabled = true },
              -- auto-completion options
              jedi_completion = { fuzzy = true },
              -- import sorting
              pyls_isort = { enabled = true },
            },
          },
        },
        flags = {
          debounce_text_changes = 200,
        },
      })


      require("mason-nvim-lint").setup({
        ensure_installed = {
          'mypy',
          'flake8',
          -- 'sonarlint-language-server',
        },
      })

      require('lint').linters_by_ft = {
        python = {
          'mypy',
          'flake8',
          -- 'sonarlint-language-server',
        }
      }
    else
      require('lspconfig').grammarly.setup({})
    end

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
