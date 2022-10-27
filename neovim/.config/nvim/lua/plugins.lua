return require('packer').startup(function(use)

    use 'wbthomason/packer.nvim'

    -- Git management:
    use {
        'tpope/vim-fugitive',
    } --TODO change for a lua one.

    use {
        'ibhagwan/fzf-lua',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function()
            require('config.fzf')
        end
    }

    --programming
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }

    use {
        'lewis6991/spellsitter.nvim',
        config = function()
            require('spellsitter').setup()
        end
    }

    use {
        'sirver/ultisnips', --TODO change for a lua one.
        config = function()
            require('config.ultisnips')
        end,
    }
    use {
        'honza/vim-snippets',
    }

    use {
        'hrsh7th/nvim-cmp',
        config = function()
            require('config.cmp')
        end,
    }
    use { 'onsails/lspkind.nvim', }
    use { 'hrsh7th/cmp-buffer', }
    use { 'hrsh7th/cmp-path', }
    use { 'hrsh7th/cmp-cmdline', }
    use { 'f3fora/cmp-spell', }
    use { 'andersevenrud/cmp-tmux', }
    use { 'quangnguyen30192/cmp-nvim-ultisnips', }
    use { 'hrsh7th/cmp-nvim-lsp-document-symbol', }
    use { 'hrsh7th/cmp-nvim-lsp', }

    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require('config.trouble')
        end
    }

    use {
        'neovim/nvim-lspconfig',
        config = function() require('lsp').setup({}) end,
    }
    use {
        'williamboman/nvim-lsp-installer',
        config = function()
            require("nvim-lsp-installer").setup {
                automatic_installation = true,
            }
            require('lsp').setup({})
        end,
    }
    use {
        "ray-x/lsp_signature.nvim",
        after = { 'nvim-lspconfig' },
        config = function()
            require "lsp_signature".setup({})
        end,
    }
    use { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu', }
    use {
        'mfussenegger/nvim-jdtls', ft = { 'java' },
        after = { 'nvim-lspconfig' },
        config = function()
            require('java')
        end,
    }
    use {
        'jose-elias-alvarez/null-ls.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            local null_ls = require('null-ls')
            null_ls.setup({
                sources = {
                    null_ls.builtins.diagnostics.flake8,
                    null_ls.builtins.diagnostics.mypy,
                    null_ls.builtins.code_actions.refactoring,
                }
            })
        end
    }

    -- Aditional Objects
    use {
        'kana/vim-textobj-user',
        event = 'VimEnter',
    } --TODO change for a lua one
    -- Indentation
    use {
        'michaeljsmith/vim-indent-object',
        after = 'nvim-lspconfig',
    } --TODO change for a lua one
    -- entire file object:
    use {
        'kana/vim-textobj-entire',
        event = 'VimEnter',
    } --TODO change for a lua one
    -- Comment as object:

    use {
        'preservim/vim-pencil',
        cmd = { 'Pencil', 'PencilSoft', 'PencilHard', 'PencilToggle' },
    }

    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup {}
        end,
    }

    -- Rooter
    use 'airblade/vim-rooter' --TODO change for a lua one

    -- Pending operator actions:
    -- Comment as action:
    use { 'tomtom/tcomment_vim', after = 'nvim-lspconfig' } --TODO change for a lua one
    use {
        'vim-scripts/ReplaceWithRegister',
    } --TODO change for a lua one
    -- surround:
    use {
        'tpope/vim-surround',
    } --TODO change for a lua one

    -- Session storage: TODO check configuration for this bad boys later
    use 'tpope/vim-obsession'
    use 'dhruvasagar/vim-prosession'

    -- Latex
    use {
        'lervag/vimtex',
        config = function()
            vim.cmd [[syntax enable]]
            vim.g.syntax = true
            vim.g.vimtex_view_general_viewer = 'zathura'
            vim.g.vimtex_view_method = 'zathura'
            vim.g.tex_flavor = 'latex'
            vim.g.vimtex_quickfix_mode = 0
            vim.g.tex_conceal = 'abdmg'
        end,
        ft = { 'tex', },
        after = { 'dracula', },
    }

    -- Style and colors
    use 'folke/tokyonight.nvim'
    use { 'dracula/vim', as = 'dracula' }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = require('lualine').setup()
    }
    use {
        'edkolev/tmuxline.vim',
        cmd = { 'Tmuxline', },
    }

end)
