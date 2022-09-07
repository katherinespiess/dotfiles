return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Git management:
    use 'tpope/vim-fugitive' --TODO change for a lua one.

    use {
        'ibhagwan/fzf-lua',
        requires = { 'kyazdani42/nvim-web-devicons' }
    }

    --programming
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
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
    use { 'honza/vim-snippets', }

    use {
        'hrsh7th/nvim-cmp',
        config = function()
            require('config.cmp')
        end,
        after = {
            'cmp-nvim-lsp',
            'cmp-buffer',
            'cmp-path',
            'cmp-cmdline',
            'cmp-nvim-lsp-document-symbol',
            'cmp-spell',
            'cmp-tmux',
            'cmp-nvim-ultisnips',
        }
    }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer', }
    use { 'hrsh7th/cmp-path', }
    use { 'hrsh7th/cmp-cmdline', }
    use { 'hrsh7th/cmp-nvim-lsp-document-symbol', }
    use { 'f3fora/cmp-spell', }
    use { 'andersevenrud/cmp-tmux', }
    use { 'quangnguyen30192/cmp-nvim-ultisnips', }

    use { 'neovim/nvim-lspconfig', }
    use { 'williamboman/nvim-lsp-installer', }
    use { 'mfussenegger/nvim-jdtls', }
    use { "ray-x/lsp_signature.nvim", }
    use { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu', }

    -- Aditional Objects
    use 'kana/vim-textobj-user' --TODO change for a lua one
    -- Indentation
    use 'michaeljsmith/vim-indent-object' --TODO change for a lua one
    -- entire file object:
    use 'kana/vim-textobj-entire' --TODO change for a lua one
    -- Comment as object:
    use 'glts/vim-textobj-comment' --TODO change for a lua one

    use {
        'preservim/vim-pencil',
        cmd = { 'Pencil', 'PencilSoft', 'PencilHard', 'PencilToggle' }
    }

    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup {}
        end
    }

    -- Rooter
    use 'airblade/vim-rooter' --TODO change for a lua one

    -- Pending operator actions:
    -- Comment as action:
    use 'tomtom/tcomment_vim' --TODO change for a lua one
    -- Replace with registry:
    use 'vim-scripts/ReplaceWithRegister' --TODO change for a lua one
    -- surround:
    use 'tpope/vim-surround' --TODO change for a lua one

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
        ft = { 'tex' }
    }

    -- Style and colors
    use 'folke/tokyonight.nvim'
    use 'dracula/vim'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = require('lualine').setup()
    }
    use 'edkolev/tmuxline.vim'

end)
