return {
  'preservim/vim-pencil',
  cmd = 'PencilSoft',
  config = function()
    vim.cmd[[
      let g:pencil#conceallevel = 0
    ]]
  end
}
