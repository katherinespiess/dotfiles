return require('packer').startup(function(use)

    use 'wbthomason/packer.nvim'

    -- Git management:
    use {
        'tpope/vim-fugitive',
    } --TODO change for a lua one.

    use {
        'ibhagwan/fzf-lua',
        requires = { 'kyazdani42/nvim-web-devicons' },
        cmp = 'FzfLua',
        config = function()
            require("fzf-lua").setup({
                lsp = {
                    -- make lsp requests synchronous so they work with null-ls
                    async_or_timeout = 3000,
                },
            })
        end
    }

    --programming
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        event = 'VimEnter',
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
        -- after = {
        --     'cmp-nvim-lsp',
        --     'cmp-buffer',
        --     'cmp-path',
        --     'cmp-cmdline',
        --     'cmp-nvim-lsp-document-symbol',
        --     'cmp-spell',
        --     'cmp-tmux',
        --     'cmp-nvim-ultisnips',
        -- },
        event = 'VimEnter',
    }
    use { 'hrsh7th/cmp-buffer', event = 'VimEnter', }
    use { 'hrsh7th/cmp-path', event = 'VimEnter', }
    use { 'hrsh7th/cmp-cmdline', event = 'VimEnter', }
    use { 'f3fora/cmp-spell', event = 'VimEnter', }
    use { 'andersevenrud/cmp-tmux', event = 'VimEnter', }
    use { 'quangnguyen30192/cmp-nvim-ultisnips', event = 'VimEnter', }
    use { 'hrsh7th/cmp-nvim-lsp-document-symbol', event = 'VimEnter', }
    use { 'hrsh7th/cmp-nvim-lsp', event = 'VimEnter', }

    use {
        'neovim/nvim-lspconfig',
        ft = { 'java', 'lua', 'python', 'tex', 'gitcommit' },
        config = function() require('lsp').setup({}) end,
    }
    use {
        'williamboman/nvim-lsp-installer',
        after = { 'nvim-lspconfig' },
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
        config = function ()
            require "lsp_signature".setup({})
        end,
    }
    use { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu', }
    use {
        'mfussenegger/nvim-jdtls', ft = { 'java' } ,
        after = { 'nvim-lspconfig' },
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
        'glts/vim-textobj-comment',
        after = 'nvim-lspconfig',
    }--TODO change for a lua one

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
    -- Replace with registry:
    use {
        'vim-scripts/ReplaceWithRegister',
        event = 'VimEnter',
    } --TODO change for a lua one
    -- surround:
    use {
        'tpope/vim-surround',
        event = 'VimEnter',
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
        ft = { 'tex' },
        after = 'dracula',
    }

    -- Style and colors
    use 'folke/tokyonight.nvim'
    use { 'dracula/vim', ft = 'tex', }
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
