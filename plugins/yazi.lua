return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    {
      "cd",
      mode = { "n" },
      "<cmd>Yazi<cr>",
      desc = "Open yazi at the current file",
    },
  },

  opts = {
    -- if you want to open yazi instead of netrw, see below for more info
    open_for_directories = true,
    keymaps = {
      show_help = "<f1>",
    },
  },
}
