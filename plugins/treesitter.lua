return {
  "nvim-treesitter/nvim-treesitter",
  -- NvChad v2.5 and nvim-treesitter-textobjects still use the legacy configs API.
  branch = "master",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "vim",
      "lua",
      "html",
      "css",
      "javascript",
      "typescript",
      "tsx",
      "c",
      "markdown",
      "markdown_inline",
      "python",
      "fish",
      "php",
      "xml",
    },
    indent = {
      enable = true,
      -- disable = {
      --   "python"
      -- },
    },
    autotag = {},
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
    require("configs.treesitter_compat").setup()
  end,
}
