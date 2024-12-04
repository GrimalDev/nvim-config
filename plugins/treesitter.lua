return {
  	"nvim-treesitter/nvim-treesitter",
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
  }
