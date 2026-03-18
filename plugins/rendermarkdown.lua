return {
  "MeanderingProgrammer/render-markdown.nvim",
  event = "BufReadPre *.md",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},
}
