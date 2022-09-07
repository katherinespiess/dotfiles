return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Version management / undo
    -- Undo tree
    use 'mbbill/undotree'
    -- Git management:
    use 'tpope/vim-fugitive'

    -- fuzzy finder
    use { 'ibhagwan/fzf-lua',
        -- optional for icon support
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

    use { 'p00f/nvim-ts-rainbow', }
    use { 'sirver/ultisnips', config = 'require(\'config.ultisnips\')', }
    use { 'honza/vim-snippets', }

    use { 'hrsh7th/nvim-cmp', config = 'require(\'config.cmp\')' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer', }
    use { 'hrsh7th/cmp-path', }
    use { 'hrsh7th/cmp-cmdline', }
    use { 'hrsh7th/cmp-emoji', }
    use { 'hrsh7th/cmp-nvim-lsp-document-symbol', }
    use { 'hrsh7th/cmp-omni', }
    use { 'f3fora/cmp-spell', }
    use { 'andersevenrud/cmp-tmux', }

    use { 'neovim/nvim-lspconfig', }
    use { 'williamboman/nvim-lsp-installer', }
    use { 'mfussenegger/nvim-jdtls', }
    use { 'quangnguyen30192/cmp-nvim-ultisnips', }
    use { "ray-x/lsp_signature.nvim", }
    use { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu', }

    -- Aditional Objects
    use 'kana/vim-textobj-user'
    -- Indentation
    use 'michaeljsmith/vim-indent-object'
    -- entire file object:
    use 'kana/vim-textobj-entire'
    -- Comment as object:
    use 'glts/vim-textobj-comment'

    -- Formatting and writing helpers
    use 'Konfekt/vim-sentence-chopper'
    use 'preservim/vim-pencil'

    -- Matching:
    use 'tmhedberg/matchit'
    -- use 'jiangmiao/auto-pairs'
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup {
                ts_config = {
                    -- lua = {'string'},-- it will not add a pair on that treesitter node
                    -- javascript = {'template_string'},
                    -- java = false,-- don't check treesitter on java
                }
            }
        end
    }
    use { 'windwp/nvim-ts-autotag', config = function () require('nvim-ts-autotag').setup() end }

    -- Tasks:
    use 'tpope/vim-dispatch'

    -- Rooter
    use 'airblade/vim-rooter'

    -- Pending operator actions:
    -- Comment as action:
    use 'tomtom/tcomment_vim'
    -- Replace with registry:
    use 'vim-scripts/ReplaceWithRegister'
    -- Evaluation:
    use 'arecarn/vim-crunch'
    -- surround:
    use 'tpope/vim-surround'

    -- Session storage:
    use 'tpope/vim-obsession'
    use 'dhruvasagar/vim-prosession'

    -- Latex
    use {
        'lervag/vimtex',
        config = 'require(\'config.vimtex\')',
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
