return {
  "aaronhallaert/advanced-git-search.nvim",
  cmd = { "AdvancedGitSearch" },
  config = function()
    -- optional: setup telescope before loading the extension
    require("telescope").setup({
      -- move this to the place where you call the telescope setup function
      extensions = {
        advanced_git_search = {},
      },
      -- Telescope layout setup
      telescope_theme = {
        function_name_1 = {
          -- Theme options
        },
        function_name_2 = "dropdown",
        -- e.g. realistic example
        show_custom_functions = {
          layout_config = { width = 0.4, height = 0.4 },
        },
      },
    })

    require("telescope").load_extension("advanced_git_search")
  end,
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
}
