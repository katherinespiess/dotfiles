-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'tpope/vim-dispatch'

    -- Version managemente / undo
        -- Undo tree
        use 'mbbill/undotree'
        -- Git management:
        use 'tpope/vim-fugitive'

end)
