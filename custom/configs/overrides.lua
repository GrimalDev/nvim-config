local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "python",
    "fish",
    "php",
    "xml",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
  autotag = {},
}

M.harpoon = {}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",
    "emmet-language-server",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- python
    "pyright",

    --php
    "intelephense",
  },
}

-- git support in nvimtree
M.nvimtree = {
  -- sync_root_with_cwd = true,
  -- respect_buf_cwd = false,
  update_cwd = false,
  update_focused_file = {
    enable = true,
    update_root = true,
    update_cwd = false,
  },

  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.cmp = {
  mapping = {
    ["<C-k>"] = require("cmp").mapping.select_prev_item(),
    ["<C-j>"] = require("cmp").mapping.select_next_item(),
    ["<Tab>"] = require("cmp").mapping.confirm(),
  },
}

M.telescope = {
  defaults = {
    file_ignore_patterns = {
      "node_modules/",
      ".git/",
      ".pyc/",
      ".mypy_cache/",
      "posdtgres_data/",
      ".rustup/",
      "%.blend",
      "%.stl",
      "vendor/",
      "Carbon/",
    },
    mappings = {
      i = {
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<esc>"] = "close",
      },
    },
    preview = {
      mime_hook = function(filepath, bufnr, opts)
       --  local is_image = function(filepath)
       --    local image_extensions = { "png", "jpg" } -- Supported image formats
       --    local split_path = vim.split(filepath:lower(), ".", { plain = true })
       --    local extension = split_path[#split_path]
       --    return vim.tbl_contains(image_extensions, extension)
       --  end
       --  if is_image(filepath) then
       --    local term = vim.api.nvim_open_term(bufnr, {})
       --    local function send_output(_, data, _)
       --      for _, d in ipairs(data) do
       --        vim.api.nvim_chan_send(term, d .. "\r\n")
       --      end
       --    end
       --    vim.fn.jobstart({
       --      "kitten",
       --      "icat",
       --      "--stdin=no",
       --      "--use-window-size=270,71,3000,2000",
       --      "--transfer-mode=file",
       --      filepath, -- Terminal image viewer command
       --    }, { on_stdout = send_output, stdout_buffered = true, pty = true })
       --  else
        require("telescope.previewers.utils").set_preview_message(bufnr, opts.winid, "Binary cannot be previewed")
       -- end
      end,
    },
  },
  extensions_list = {
    "themes",
    "file_browser",
    -- "projects",
    "undo",
    "fzf",
    "refactoring",
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = false,
      prompt_path = true,
      git_status = false,
      hide_parent_dir = true,
      hidden = true,
      respect_gitignore = false,
      title = "File Browser ( Hidden )",
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
          -- ["<C-h>"] = fb_actions.backspace,
          -- ["<C-h>"] = require "telescope".extensions.file_browser.actions.backspace,
          -- ["<Tab>"] = function (prompt_bufnr)
          --   require "telescope".extensions.file_browser.actions.goto_cwd(prompt_bufnr)
          -- end,
          ["<C-h>"] = function(prompt_bufnr, bypass)
            require("telescope").extensions.file_browser.actions.backspace(prompt_bufnr, bypass)
            local current_picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
            local finder = current_picker.finder
            finder.depth = 1
            finder.add_dirs = true
          end,
          ["<C-s>"] = function(prompt_bufnr)
            local current_picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
            local finder = current_picker.finder
            if not finder.hidden and not finder.depth then
              finder.hidden = true
              finder.respect_gitignore = false
              current_picker.prompt_border:change_title "File Browser (All files + Hidden)"
            elseif not finder.hidden then
              finder.hidden = true
              finder.respect_gitignore = false
              current_picker.prompt_border:change_title "File Browser ( Hidden )"
            elseif not finder.depth then
              finder.hidden = false
              finder.respect_gitignore = true
              current_picker.prompt_border:change_title "File Browser (All files)"
            elseif finder.hidden then
              finder.hidden = false
              finder.respect_gitignore = true
              current_picker.prompt_border:change_title "File Browser"
            end

            current_picker:refresh(finder, { reset_prompt = false })
            -- require "telescope".extensions.file_browser.actions.toggle_hidden(prompt_bufnr, {reset_prompt=false, respect_gitignore=true})
          end,
          -- ["<C-f>"] = function (prompt_bufnr)
          --   require "telescope.actions.state".get_current_picker(prompt_bufnr):refresh(require "telescope.builtin".find_files({hidden=true, no_ignore=true}), {reset_prompt = false})
          -- end,
          ["<C-f>"] = function(prompt_bufnr)
            local current_picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
            local finder = current_picker.finder
            if not finder.hidden and finder.depth then
              finder.depth = false
              finder.add_dirs = false
              current_picker.prompt_border:change_title "File Browser (All files)"
            elseif finder.hidden and finder.depth then
              finder.depth = false
              finder.add_dirs = false
              current_picker.prompt_border:change_title "File Browser (All files + Hidden)"
            elseif finder.hidden and not finder.depth then
              finder.depth = 1
              finder.add_dirs = true
              current_picker.prompt_border:change_title "File Browser ( Hidden )"
            elseif not finder.hidden and not finder.depth then
              finder.depth = 1
              finder.add_dirs = true
              current_picker.prompt_border:change_title "File Browser"
            end

            current_picker:refresh(finder, { reset_prompt = false })
          end,

          ["<C-d>"] = function(prompt_bufnr)
            local current_picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
            local finder = current_picker.finder

            finder.cwd = finder.path
            finder.files = not finder.files

            current_picker:refresh(finder, { reset_prompt = false, multi = current_picker._multi })
          end,

          ["<A-i>"] = function(prompt_bufnr)
            require("telescope").extensions.file_browser.actions.copy(prompt_bufnr)
          end,
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
}

-- M.copilot = {
--   panel = {
--     enabled = false,
--     auto_refresh = true,
--     keymap = {
--       jump_prev = "[[",
--       jump_next = "]]",
--       accept = "<CR>",
--       refresh = "gr",
--       open = "<M-CR>",
--     },
--     layout = {
--       position = "bottom", -- | top | left | right
--       ratio = 0.4,
--     },
--   },
--   suggestion = {
--     enabled = true,
--     auto_trigger = true,
--     debounce = 75,
--     keymap = {
--       accept = "<C-g>",
--       accept_word = false,
--       accept_line = false,
--       next = "<M-]>",
--       prev = "<M-[>",
--       dismiss = "<C-]>",
--     },
--   },
--   filetypes = {
--     yaml = true,
--     markdown = true,
--     help = false,
--     gitcommit = true,
--     gitrebase = false,
--     hgcommit = false,
--     svn = false,
--     cvs = false,
--     ["."] = false,
--   },
--   copilot_node_command = "node", -- Node.js version must be > 18.x
--   server_opts_overrides = {},
-- }

M.octo = {
  suppress_missing_scope = {
    projects_v2 = true,
  },
  colors = { -- used for highlight groups (see Colors section below)
    white = "#ffffff",
    grey = "#2A354C",
    black = "#000000",
    red = "#fdb8c0",
    dark_red = "#da3633",
    green = "#acf2bd",
    dark_green = "#238636",
    yellow = "#d3c846",
    dark_yellow = "#735c0f",
    blue = "#58A6FF",
    dark_blue = "#0366d6",
    purple = "#6f42c1",
  },
  mappings = {
    pull_request = {
      checkout_pr = { lhs = "<space>po", desc = "checkout PR" },
      merge_pr = { lhs = "<space>pm", desc = "merge commit PR" },
      open_in_browser = { lhs = "<C-b>", desc = "open PR in browser" },
      review_start = { lhs = "<space>vs", desc = "start a review for the current PR" },
      review_resume = { lhs = "<space>vr", desc = "resume a pending review for the current PR" },
    },
  },
}

M.muren = {
  -- general
  create_commands = true,
  filetype_in_preview = true,
  -- default togglable options
  two_step = false,
  all_on_line = true,
  preview = true,
  cwd = false,
  files = "**/*",
  -- keymaps
  keys = {
    close = "q",
    toggle_side = "<Tab>",
    toggle_options_focus = "<C-s>",
    toggle_option_under_cursor = "<CR>",
    scroll_preview_up = "<Up>",
    scroll_preview_down = "<Down>",
    do_replace = "<M-a>",
    -- NOTE these are not guaranteed to work, what they do is just apply `:normal! u` vs :normal! <C-r>`
    -- on the last affected buffers so if you do some edit in these buffers in the meantime it won't do the correct thing
    do_undo = "<localleader>u",
    do_redo = "<localleader>r",
  },
  -- ui sizes
  patterns_width = 30,
  patterns_height = 10,
  options_width = 20,
  preview_height = 12,
  -- window positions
  anchor = "center", -- Set to one of:
  -- 'center' | 'top' | 'bottom' | 'left' | 'right' | 'top_left' | 'top_right' | 'bottom_left' | 'bottom_right'
  vertical_offset = 0, -- offsets are relative to anchors
  horizontal_offset = 0,
  -- options order in ui
  order = {
    "buffer",
    "dir",
    "files",
    "two_step",
    "all_on_line",
    "preview",
  },
  -- highlights used for options ui
  hl = {
    options = {
      on = "@string",
      off = "@variable.builtin",
    },
    preview = {
      cwd = {
        path = "Comment",
        lnum = "Number",
      },
    },
  },
}

M.executor = {
  commands = {
    -- `%` represent the current file name
    -- file type
    cpp = {
      -- command(s) to excute
      "make",
      "lua require('nvterm.terminal').send('g++ % && ./a.out ' .. vim.fn.expand('%'), 'horizontal')",
      extern = false,
    },
    go = {
      "lua require('nvterm.terminal').send('go run ' .. vim.fn.expand('%'), 'horizontal')",
      extern = false,
    },
    python = {
      "lua require('nvterm.terminal').send('python3 ' .. vim.fn.expand('%'), 'horizontal')",
      extern = false,
    },
    javascript = {
      "lua require('nvterm.terminal').send('bun ' .. vim.fn.expand('%'), 'horizontal')",
      extern = false,
    },
    sh = {
      "lua require('nvterm.terminal').send('bash ' .. vim.fn.expand('%'), 'horizontal')",
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
      "lua require('nvterm.terminal').send('php ' .. vim.fn.expand('%'), 'horizontal')",
      extern = false,
    },
    dart = {
      "FlutterRun",
      extern = false,
    },
    html = {
      "lua require('nvterm.terminal').send('live-server ' .. vim.fn.expand('%'), 'horizontal')",
      extern = false,
    },
  },
  default_mappings = false, -- use default mapping
  always_exit = false, -- always exit terminal no matter status of previous command

  dependency_commands = {
    -- the command make requires the presents of a makefile in cwd, if
    -- makefile is not found, try next command in table
    make = "makefile",
    -- term = "lua require('nvterm.terminal').new 'horizontal'",
  },
}

M.flutter_tools = {
  dev_log = {
    enabled = false,
    notify_errors = true, -- if there is an error whilst running then notify the user
    open_cmd = "!tmux new-window 'nvim ~'", -- command to use to open the log buffer
  },
}

M.avante = {
  mappings = {
    ask = "<leader>ia",
    edit = "<leader>ie",
    refresh = "<leader>ir",
  },
  behaviour = {
    support_paste_from_clipboard = true,
  },
  hints = {
    enabled = false,
  },
}

M.dap = function()
  local dap = require "dap"
  local dapui = require "dapui"

  dapui.setup()

  -- docker path
  local docker_path = "/var/www/html"
  local env_docker_path = os.getenv "DOCKER_PATH"
  if env_docker_path and type(env_docker_path) == "string" then
    docker_path = env_docker_path
  end

  -- PHP --
  dap.adapters.php = {
    id = "php",
    type = "executable",
    command = vim.fn.exepath "php-debug-adapter",
    localSourceRoot = vim.fn.expand "%:p:h" .. "/",
    serverSourceRoot = vim.fn.expand "%:p:h" .. "/",
  }
  dap.configurations.php = {
    {
      name = "run current script",
      type = "php",
      request = "launch",
      port = 9003,
      cwd = "${fileDirname}",
      program = "${file}",
      runtimeExecutable = "php",
    },
    {
      name = "listen for Xdebug local",
      type = "php",
      request = "launch",
      port = 9003,
    },
    {
      name = "listen for Xdebug docker",
      type = "php",
      request = "launch",
      port = 9003,
      pathMappings = {
        ["/home/immo/www"] = "${workspaceFolder}",
      },
    },
  }

  vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "ErrorMsg", linehl = "", numhl = "ErrorMsg" })
  vim.fn.sign_define("DapBreakpointCondition", { text = "⬤", texthl = "ErrorMsg", linehl = "", numhl = "SpellBad" })
  vim.fn.sign_define("DapStopped", { text = "", texthl = "ErrorMsg", linehl = "", numhl = "ErrorMsg" })

  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end
end

-- M.hardtime = {
--   showmode = false,
--   disabled_keys = {
--     ["<Up>"] = { "i" },
--     ["<Down>"] = { "i" },
--     ["<Left>"] = { "i" },
--     ["<Right>"] = { "i" },
--   },
--   -- restricted_keys = {
--   --   ["<Delete>"] = { "n", "x", "i" },
--   -- },
-- }

return M
