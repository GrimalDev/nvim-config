return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    indent = {
      enabled = true,
      -- chunk = {
      --   enabled = true,
      -- },
      animate = {
        enabled = vim.fn.has "nvim-0.10" == 1,
        style = "up_down",
        easing = "linear",
        duration = {
          step = 10, -- ms per step
          total = 300, -- maximum duration
        },
      },
    },
    input = { enabled = true },
    notifier = { enabled = true },
    -- quickfile = { enabled = true },
    scroll = {
      enabled = true,
      animate = {
        duration = { step = 15, total = 150 },
        easing = "linear",
      },
      -- faster animation when repeating scroll after delay
      animate_repeat = {
        delay = 100, -- delay in ms before using the repeat animation
        duration = { step = 20, total = 50 },
        easing = "linear",
      },
    },
    -- statuscolumn = { enabled = true },
    -- words = { enabled = true },
  },
}
