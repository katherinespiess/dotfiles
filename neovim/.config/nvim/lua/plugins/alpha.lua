return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'nvim-lua/plenary.nvim'
  },
  config = function()
    local dashboard = require("alpha.themes.dashboard")
    local theta = require 'alpha.themes.theta'

    local buttons = {
      type = "group",
      val = {
        { type = "text",    val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
        { type = "padding", val = 1 },
        dashboard.button("s", "󱉆  Start", "<cmd>Prosession " .. vim.fn.getcwd() .. "<CR>"),
        -- dashboard.button("f", "󰈞  Find file", '<cmd>Telescope oldfiles<CR>'),
        dashboard.button("u", "  Update plugins", "<cmd>Lazy sync<CR>"),
        dashboard.button("q", "󰅚  Quit", "<cmd>qa<CR>"),
      },
      position = "center",
    }

    local counter = 0
    local section_sessions = {
      type = "group",
      val = {
        {
          type = "text",
          val = "Sessions",
          opts = {
            hl = "SpecialComment",
            shrink_margin = false,
            position = "center",
          },
        },
        { type = "padding", val = 1},
        {
          type = "group",
          val = function ()
              local bts = { }
              counter = 0
              local l =  vim.fn.glob(vim.fn.fnamemodify(vim.g.prosession_dir, ":p") .. "**.vim", 0, 1)
              for i,v in pairs(l) do
                local path = vim.fn.substitute(vim.fn.fnamemodify(v, ":t:r"), "%", "/", "g")
                local display = path
                display = display:gsub(vim.fn.expand("~"), "~")
                display = display:gsub("\\", "/")
                display = "  " .. display .. "/"
                bts[i] = dashboard.button(tostring(counter), display, "<cmd>Prosession " .. path .. "<CR>")
                counter = counter + 1
              end
            return bts
          end
        }
      },
    }

    local section_mru = {
      type = "group",
      val = {
        {
          type = "text",
          val = "Most recent used",
          opts = {
            hl = "SpecialComment",
            shrink_margin = false,
            position = "center",
          },
        },
        { type = "padding", val = 1 },
        {
          type = "group",
          val = function()
            return { theta.mru(counter, vim.fn.getcwd(), 10, { autocd = true, }) }
          end,
          opts = { shrink_margin = false },
        },
      },
    }

    local config = {
      layout = {
        { type = "padding", val = 2 },
        theta.header,
        { type = "padding", val = 1 },
        {
          type = "text",
          val = vim.fn.getcwd():gsub(vim.fn.expand("~"),"~"):gsub("\\", "/") .. "/",
          opts = {
            hl = "SpecialComment",
            shrink_margin = false,
            position = "center",
          },
        },
        { type = "padding", val = 2 },
        buttons,
        { type = "padding", val = 2 },
        section_sessions,
        { type = "padding", val = 2 },
        section_mru,
      },
      opts = {
        margin = 5,
        setup = function()
          vim.api.nvim_create_autocmd('DirChanged', {
            pattern = '*',
            group = "alpha_temp",
            callback = function()
              require('alpha').redraw()
              vim.cmd('AlphaRemap')
            end,
          })
        end,
      },
    }
    require('alpha').setup(config)

    vim.keymap.set('n', '<leader>h', '<CMD>Alpha<CR>', { noremap = true, silent = true, desc = 'OpenAlpha' })
  end
}
