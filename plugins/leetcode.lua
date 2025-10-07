return {
  "kawre/leetcode.nvim",
  cmd = "Leet",
  event = "VimEnter",
  build = ":TSUpdate html",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim", -- picker
  },
  opts = {
    lang = "python3",
    keys = {
      toggle = { "q" },
      confirm = { "<CR>" },

      reset_testcases = "r",
      use_testcase = "U",
      focus_testcases = "H",
      focus_result = "L",
    },

    theme = {},

    image_support = true,
  },
}
