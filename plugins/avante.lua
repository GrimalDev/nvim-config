return {
  "yetone/avante.nvim",
  -- enabled = false,

  -- dir = vim.fn.expand "~/Code/Projects/avante.nvim",
  -- dev = true,

  -- event = "VeryLazy",
  cmd = { "Avante", "AvanteToggle", "AvanteClear" },
  lazy = true,
  version = false, -- set this if you want to always pull the latest change
  opts = require "configs.avante",
  build = "make",

  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "echasnovski/mini.pick", -- for file_selector provider mini.pick
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      config = function(_, opts)
        require("render-markdown").setup(opts)
      end,
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
  keys = function(_, keys)
    local opts =
      require("lazy.core.plugin").values(require("lazy.core.config").spec.plugins["avante.nvim"], "opts", false)

    local mappings = {
      {
        opts.mappings.ask,
        function()
          require("avante.api").ask()
        end,
        desc = "avante AI: ask",
        mode = { "n", "v" },
      },
      {
        opts.mappings.clear,
        function()
          require("avante.api").clear()
        end,
        desc = "avante AI: clear",
        mode = { "n", "v" },
      },
      {
        opts.mappings.refresh,
        function()
          require("avante.api").refresh()
        end,
        desc = "avante AI: refresh",
        mode = "v",
      },
      {
        opts.mappings.edit,
        function()
          require("avante.api").edit()
        end,
        desc = "avante AI: edit",
        mode = { "n", "v" },
      },
    }
    mappings = vim.tbl_filter(function(m)
      return m[1] and #m[1] > 0
    end, mappings)
    return vim.list_extend(mappings, keys)
  end,

  input = {
    provider = "snacks",
    provider_opts = {
      -- Additional snacks.input options
      title = "Avante Input",
      icon = " ",
    },
  },
}
