return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  event = {
    "BufReadPre ~/Dropbox/Apps/remotely-save/Notes/**.md",
    "BufNewFile ~/Dropbox/Apps/remotely-save/Notes/**.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Dropbox/Apps/remotely-save/Notes/",
      },
    },
  },
}
