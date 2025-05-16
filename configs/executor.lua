-- local terminalConfig =  {
--    pos = "sp", -- sp/vsp/float
--    cmd = "neofetch", -- string or function
--    size = 0.5, -- # for split windows only
--    winopts = {}, -- window options
--    id =  "any string", -- needed for toggle/runner func
--    float_opts = {}, -- # for floating window only, options of :h nvim_open_win
--    clear_cmd = true -- needed for runner func*
--  }

return {
  commands = {
    -- `%` represent the current file name
    -- file type
    cpp = {
      -- command(s) to excute
      "make",
      "lua require('nvchad.term').new { pos = 'bo sp', size = 0.3, id = 'cpp executor', cmd = 'g++ % && ./a.out ' .. vim.fn.expand('%') .. ' && exit'}",
      extern = false,
    },
    go = {
      "lua require('nvchad.term').new { pos = 'bo sp', size = 0.3, id = 'go executor', cmd = 'go run ' .. vim.fn.expand('%') .. ' && exit'}",
      extern = false,
    },
    python = {
      "lua require('nvchad.term').new { pos = 'bo sp', size = 0.3, id = 'python executor', cmd = 'python3 ' .. vim.fn.expand('%') .. ' && exit'}",
      extern = false,
    },
    javascript = {
      "lua require('nvchad.term').new { pos = 'bo sp', size = 0.3, id = 'javascrip executor', cmd = 'bun ' .. vim.fn.expand('%') .. ' && exit'}",
      extern = false,
    },
    sh = {
      "lua require('nvchad.term').new { pos = 'bo sp', size = 0.3, id = 'sh executor', cmd = 'bash ' .. vim.fn.expand('%') .. ' && exit'}",
      extern = false,
    },
    vim = {
      "source %",
      extern = false, -- run command in pop terminal instead of terminal
      -- in new tab
    },
    lua = {
      "luafile %",
      extern = false,
    },
    markdown = {
      "MarkdownPreview",
      extern = false,
    },
    php = {
      "lua require('nvchad.term').new { pos = 'bo sp', size = 0.3, id = 'php executor', cmd = 'php ' .. vim.fn.expand('%') .. ' && exit'}",
      extern = false,
    },
    dart = {
      "FlutterRun",
      extern = false,
    },
    html = {
      "lua require('nvchad.term').new { pos = 'bo sp', size = 0.3, id = 'html executor', cmd = 'live-server ' .. vim.fn.expand('%') .. ' && exit'}",
      extern = false,
    },
  },
  default_mappings = false, -- use default mapping
  always_exit = false, -- always exit terminal no matter status of previous command
  notify = false,

  dependency_commands = {
    -- the command make requires the presents of a makefile in cwd, if
    -- makefile is not found, try next command in table
    make = "makefile",
    -- term = "lua require('nvterm.terminal').new 'horizontal'",
  },
}
