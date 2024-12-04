return {
  "tpope/vim-dotenv",
  event = "VeryLazy",
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

    vim.cmd("verbose Dotenv" .. envFile)
  end,
}
