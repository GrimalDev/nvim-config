return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  opts = {
    panel = {
      enabled = false,
      -- auto_refresh = true,
      -- keymap = {
      --   jump_prev = "[[",
      --   jump_next = "]]",
      --   accept = "<CR>",
      --   refresh = "gr",
      --   open = "<M-CR>",
      -- },
      -- layout = {
      --   position = "bottom", -- | top | left | right
      --   ratio = 0.4,
      -- },
    },
    suggestion = {
      enabled = false,
      -- auto_trigger = true,
      -- debounce = 75,
      -- keymap = {
      --   accept = "<C-g>",
      --   accept_word = false,
      --   accept_line = false,
      --   next = "<M-]>",
      --   prev = "<M-[>",
      --   dismiss = "<C-]>",
      -- },
    },
    filetypes = {
      yaml = true,
      markdown = true,
      help = false,
      gitcommit = true,
      gitrebase = false,
      hgcommit = false,
      svn = false,
      cvs = false,
      ["."] = false,
    },
    server_opts_overrides = {},
  },
}
