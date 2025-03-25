return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "debugloop/telescope-undo.nvim",
    "lpoto/telescope-docker.nvim",
    "nvim-telescope/telescope-fzf-native.nvim",
    "debugloop/telescope-undo.nvim",
    "jonarrien/telescope-cmdline.nvim",
  },
  opts = require "configs.telescope",
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension "cmdline"
  end,
}
