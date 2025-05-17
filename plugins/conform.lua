return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = require "configs.conform",
}
