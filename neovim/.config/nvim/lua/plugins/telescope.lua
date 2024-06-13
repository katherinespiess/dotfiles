return {
  'nvim-telescope/telescope.nvim', tag = '0.1.6',
  event = 'VeryLazy',
  cmd = 'Telescope',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'debugloop/telescope-undo.nvim',
    'rafi/telescope-thesaurus.nvim',
  },
  config = function()
    vim.keymap.set('n', '<leader>b', '<CMD>Telescope buffers<CR>',  { noremap = true, silent = true, desc = 'Find buffer'})
    vim.keymap.set('n', '<leader>i', '<CMD>Telescope builtin<CR>',  { noremap = true, silent = true, desc = 'Finders'})
    vim.keymap.set('n', '<leader>f', '<CMD>Telescope find_files<CR>', { noremap = true, silent = true, desc = 'Find Files'})
    vim.keymap.set('n', '<leader>k', '<cmd>Telescope thesaurus lookup<CR>', {noremap = true, silent = true, desc = 'Dictionary / thesaurus'})

    require("telescope").setup({
      extensions = {
        thesaurus = {
          -- provider = 'datamuse',
          provider = 'freedictionaryapi',
        },
        undo = {
          mappings = {
            i = {
              ["<cr>"] = require("telescope-undo.actions").restore,
              ["<C-cr>"] = require("telescope-undo.actions").yank_additions,
              ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
            },
            n = {
              ["u"] = require("telescope-undo.actions").restore,
              ["<cr>"] = require("telescope-undo.actions").restore,
              ["y"] = require("telescope-undo.actions").yank_additions,
              ["Y"] = require("telescope-undo.actions").yank_deletions,
            },
          },
        },
      },
    })


    require("telescope").load_extension("undo")
    require("telescope").load_extension("thesaurus")

    vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>", {silent = true, desc = 'Undo tree'});

    require('telescope').load_extension('prosession')
    vim.keymap.set("n", "<leader>s", "<cmd>Telescope prosession<cr>", {silent = true, desc = 'Switch session'});

  end
}
