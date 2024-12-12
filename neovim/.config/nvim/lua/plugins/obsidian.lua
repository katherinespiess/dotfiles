return {
  "epwalsh/obsidian.nvim",
  version = "3.7.13", -- recommended, use latest release instead of latest commit
  ft = { "markdown", "md", },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "Notes",
        path = vim.fn.has('win64') <= 0 and "~/Dropbox/Apps/remotely-save/Notes/" or  "~/Documents/2024/OSs/",
      },
    },
    daily_notes = {
      date_format = "d%Y%m%d",
      alias_format = "%A, %d/%b/%Y",
      template = 'diary.md',
    },
    templates = {
      folder = "templates",
      date_format = "%A, %d/%b/%Y",
      time_format = "%H:%M",
      -- A map for custom variables, the key should be the variable and the value a function
      substitutions = {},
    },
    follow_url_func = function(url)
      -- Open the URL in the default web browser.
      vim.fn.jobstart({vim.fn.has('win64') <= 0 and "open" or "explorer", url})  -- Mac OS
      -- vim.fn.jobstart({"xdg-open", url})  -- linux
    end,
  },
}
