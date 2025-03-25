return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  dependencies = "nvim-treesitter/nvim-treesitter",
  -- lazy = false,
  -- event = "VeryLazy",
  config = function()
    require("nvim-treesitter.configs").setup(require "configs.moretextobjects")
  end,
}
