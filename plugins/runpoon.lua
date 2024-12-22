return {
  "GrimalDev/runpoon.nvim",
  event = "VeryLazy",
  config = function()
    require "runpoon"
    -- require("telescope").load_extension "runpoon"
    -- add runpoon to telescope
  end,
}
