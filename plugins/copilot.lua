return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  -- enabled = false,
  config = function()
    require("copilot").setup {
      suggestion = {
        enabled = false,
        auto_trigger = true,
        hide_during_completion = true,
        debounce = 75,
        keymap = {
          accept = "<right>",
          accept_word = false,
          accept_line = false,
          next = "<M-space>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      panel = {
        enabled = false,
        auto_refresh = false,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<CR>",
          refresh = "gr",
          open = "<C-right>",
        },
        layout = {
          position = "bottom", -- | top | left | right
          ratio = 0.3,
        },
      },
    }
  end,
}
