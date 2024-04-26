return {
    'goolord/alpha-nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'nvim-lua/plenary.nvim'
    },
    config = function ()

        local dashboard = require("alpha.themes.dashboard")
        local theta = require'alpha.themes.theta'

        local buttons = {
            type = "group",
            val = {
                { type = "text", val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
                { type = "padding", val = 1 },
                -- dashboard.button("e", "  New file", "<cmd>ene<CR>"),
                dashboard.button("e", "  New file" , ":ene <BAR> startinsert <CR>"),
                dashboard.button("f", "󰈞  Find file", '<cmd>Telescope oldfiles<CR>'),
                dashboard.button("g", "󰊄  Live grep", '<cmd>Telescope live_grep<CR>'),
                dashboard.button("s", "  Sessions", "<cmd>Telescope prosession<CR>"),
                dashboard.button("u", "  Update plugins", "<cmd>Lazy sync<CR>"),
                dashboard.button("c", "  Configurations", function()
                  vim.cmd("Prosession " .. vim.fn.stdpath("config"))
                end),
                dashboard.button("q", "󰅚  Quit", "<cmd>qa<CR>"),
            },
            position = "center",
        }

        local section_mru = {
            type = "group",
            val = {
                {
                    type = "text",
                    val = vim.fn.getcwd,
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
                        return { theta.mru(0, cdir, 10, { autocd = true, }) }
                    end,
                    opts = { shrink_margin = false },
                },
            },
        }

        local section_mru_home = {
            type = "group",
            val = {
                {
                    type = "text",
                    val = vim.fn.expand("~"),
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
                        return { theta.mru(10, vim.fn.expand("~"), 30, { autocd = true, }) }
                    end,
                    opts = { shrink_margin = false },
                },
            },
        }


        local config = {
          layout = {
              { type = "padding", val = 2 },
              theta.header,
              { type = "padding", val = 2 },
              buttons,
              { type = "padding", val = 2 },
              section_mru,
              { type = "padding", val = 2 },
              section_mru_home,
          },
          opts = {
              margin = 5,
              setup = function()
                  vim.api.nvim_create_autocmd('DirChanged', {
                      pattern = '*',
                      group = "alpha_temp",
                      callback = function ()
                          require('alpha').redraw()
                          vim.cmd('AlphaRemap')
                      end,
                  })
              end,
          },
      }
      require('alpha').setup(config)

      vim.keymap.set('n', '<leader>h', '<CMD>Alpha<CR>', { noremap = true, silent = true, desc = 'OpenAlpha'})
    end
}
