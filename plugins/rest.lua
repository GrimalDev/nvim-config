return {
  "rest-nvim/rest.nvim",
  cmd = { "Rest" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "http")
      require("telescope").load_extension "rest"
    end,
  },
}
