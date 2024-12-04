return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  dependencies = {
    "nvim-telescope/telescope-file-browser.nvim",
    "debugloop/telescope-undo.nvim",
    "lpoto/telescope-docker.nvim",
    "nvim-telescope/telescope-fzf-native.nvim",
    "debugloop/telescope-undo.nvim",
  },
  opts = require("configs.telescope")
}
