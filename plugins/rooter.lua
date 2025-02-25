return {
  "notjedi/nvim-rooter.lua",
  lazy = false,
  config = function()
    require("nvim-rooter").setup {
      rooter_patterns = { ".env.local", ".env", ".git" },
      trigger_patterns = { "*" },
      manual = true,
      fallback_to_parent = false,
    }
  end,
}
