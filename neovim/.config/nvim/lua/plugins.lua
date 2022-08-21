-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Version managemente / undo
        -- Undo tree
        use 'mbbill/undotree'
        -- Git management:
        use 'tpope/vim-fugitive'

    -- fuzzy finder
        use { 'ibhagwan/fzf-lua',
          -- optional for icon support
          requires = { 'kyazdani42/nvim-web-devicons' }
        }

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
        use 'jiangmiao/auto-pairs'

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
            config = require('config.vimtex'),
            ft = {'tex'}
        }

    -- snippets
        use {
            'sirver/ultisnips',
            config = require('config.ultisnips')
        }

    -- Colors
        use 'folke/tokyonight.nvim'
        use 'dracula/vim'
end)
