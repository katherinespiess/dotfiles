return {
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
}
