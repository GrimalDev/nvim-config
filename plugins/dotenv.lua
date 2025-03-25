return {
  "tpope/vim-dotenv",
  priority = 1000, -- Highest priority to load first
  lazy = false, -- Load during startup, not lazy-loaded
  config = function()
    local envFiles = {
      ".env.local",
      ".env",
    }

    local envFile = nil

    for _, file in ipairs(envFiles) do
      if vim.fn.filereadable(file) == 1 then
        envFile = file
        break
      end
    end

    if envFile == nil then
      return
    end

    vim.cmd("Dotenv" .. envFile)
  end,
}
