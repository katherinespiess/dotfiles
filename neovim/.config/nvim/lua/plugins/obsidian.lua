return {
  "epwalsh/obsidian.nvim",
  version = "3.7.13", -- recommended, use latest release instead of latest commit
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "Notes",
        path = "~/Dropbox/Apps/remotely-save/Notes/",
      },
    },
    daily_notes = {
      date_format = "d%Y%m%d",
      template = 'diary.md',
    },
    templates = {
      folder = "templates",
      date_format = "%A, %d/%b/%Y",
      time_format = "%H:%M",
      -- A map for custom variables, the key should be the variable and the value a function
      substitutions = {},
    },
  },
}
