return {
  'SirVer/ultisnips',
  dependencies = {
    'honza/vim-snippets',
  },
  config = function()
    vim.g.UltiSnipsExpandTrigger="<tab>"
    vim.g.UltiSnipsJumpForwardTrigger="<tab>"
    vim.g.UltiSnipsJumpBackwardTrigger="<s-tab>"

    -- vim.g.UltiSnipsSnippetDirectories = {'lua'}
    vim.cmd('let g:UltiSnipsSnippetDirectories = ["C:/Users/310216903/AppData/Local/nvim/local_snippets/"]')
  end
}
