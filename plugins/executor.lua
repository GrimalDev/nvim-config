return {
  "GrimalDev/executor.nvim",
  config = function()
    -- overide a language execution if any environement id set with with the prefix RUN_
    local injectedConfig = require "configs.executor"
    for lang, _ in pairs(injectedConfig.commands) do
      if os.getenv("RUN_" .. lang:upper()) then
        injectedConfig.commands[lang][1] = os.getenv("RUN_" .. lang:upper())
      end
    end
    require("executor").setup(injectedConfig)
  end,
}
