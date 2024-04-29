return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    vim.keymap.set('n', '<localleader>h', function()
      vim.cmd('cclose')
      vim.cmd('Trouble quickfix')
    end, { desc = 'better quick fix' })

    vim.keymap.set('n', '<localleader>n', function()
      require("trouble").next({ skip_groups = true, jump = true })
    end, { desc = 'next issue' })

    vim.keymap.set('n', '<localleader>n', function()
      require("trouble").next({ skip_groups = true, jump = true })
    end, { desc = 'previous issue' })
  end
}
