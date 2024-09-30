local M = {}

-- Map keys for multiple modes
local multimap = function(section)
  local mappings = { plugin = section.plugin }
  local keys = section.keys

  for _, mode in ipairs(section.mode) do
    mappings[mode] = keys
  end
  return mappings
end

M.disabled = {
  ["z"] = "",
  ["f"] = "",
  ["<C-u>"] = "",
  ["<C-q>"] = "",
}

M.text = {
  i = {
    ["<C-Up>"] = { "<cmd> :m-2<CR>", " Move up" },
    ["<C-Down>"] = { "<cmd> :m+<CR>", " Move down" },
  },
  n = {
    ["<C-Up>"] = { "<cmd> :m-2<CR>", " Move up" },
    ["<C-Down>"] = { "<cmd> :m+<CR>", " Move down" },
  },

  v = {
    -- ["<C-k"] = { "<cmd> :m '<-2<CR>gv=gv", "󰜸 Move selection up", opts = { silent = true } },
    -- ["<C-j>"] = { "<cmd> :m '>+1<CR>gv=gv", "󰜯 Move selection down", opts = { silent = true } },
  },

  c = {
    ["<C-k>"] = { "<C-p>", "nav prev " },
    ["<C-j>"] = { "<C-n>", "nav next " },
  },
}

M.textobjects = multimap {
  mode = { "o", "x" },
  keys = {
    ["as"] = { '<cmd>lua require("various-textobjs").subword("outer")<CR>', "Select a subword" },
    ["is"] = { '<cmd>lua require("various-textobjs").subword("inner")<CR>', "Select inner subword" },
    ["ac"] = { '<cmd>lua require("various-textobjs").cssColor("outer")<CR>', "Select a css color" },
    ["ic"] = { '<cmd>lua require("various-textobjs").cssColor("inner")<CR>', "Select inner css color" },
    ["aN"] = { '<cmd>lua require("various-textobjs").number("outer")<CR>', "Select a number" },
    ["iN"] = { '<cmd>lua require("various-textobjs").number("inner")<CR>', "Select inner number" },
    ["aa"] = { '<cmd>lua require("various-textobjs").indentation("outer", "outer")<CR>', "Select a indentation" },
    ["o"] = { "iw", "iw" },
    ["O"] = { '<cmd>lua require("various-textobjs").subword("inner")<CR>', "inner subword" },
    ["q"] = { '<cmd>lua require("various-textobjs").toNextQuotationMark()<CR>', "to next to next quotation mark" },
    ["'"] = { '<cmd>lua require("various-textobjs").anyQuote("inner")<CR>', "inner any quote" },
  },
}

vim.keymap.set("v", "<C-j>", ":m '>+1<CR> gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR> gv=gv")

M.general = {
  i = {
    ["<A-r>"] = { "<cmd> tabnew<CR>", "New tab" },
    ["<C-h>"] = { "<Backspace>", "Backspace" },

    ["<A-f>"] = { "<cmd> :lua require('harpoon.ui').nav_file(1) <CR>", "Harpoon switch 1" },
    ["<A-d>"] = { "<cmd> :lua require('harpoon.ui').nav_file(2) <CR>", "Harpoon switch 2" },
    ["<A-s>"] = { "<cmd> :lua require('harpoon.ui').nav_file(3) <CR>", "Harpoon switch 3" },
    ["<A-a>"] = { "<cmd> :lua require('harpoon.ui').nav_file(4) <CR>", "Harpoon switch 4" },
    ["<C-s>"] = { "<cmd> w <CR>", "Save file" },

    -- ["<C-g>"] = { "<cmd> :Copilot suggestion accept <CR>", "Acccept Copilot suggestion" },
  },

  n = {
    ["<F9>"] = { "<C-w><", "Decrease width" },
    ["<F10>"] = { "<C-w>>", "Increase width" },
    ["<F11>"] = { "<C-w>+", "Increase height" },
    ["<F12>"] = { "<C-w>-", "Decrease height" },
    ["<C-h>"] = { "<C-w>h", "Window left" },
    ["<C-l>"] = { "<C-w>l", "Window right" },
    ["<C-j>"] = { "<C-w>j", "Window down" },
    ["<C-k>"] = { "<C-w>k", "Window up" },

    ["<A-x>"] = { "<C-w>c", "Window close" },

    ["<A-e>"] = { "<cmd> qa<CR>", "Exit" },

    ["<A-r>"] = { "<cmd> tabnew<CR>", "New tab" },
    ["<Up>"] = { "<cmd> tabnext<CR>", "Next tab" },
    ["<Down>"] = { "<cmd> tabprevious<CR>", "Previous tab" },

    ["<right>"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },
    ["<left>"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },

    ["<leader>uu"] = { "<cmd> Lazy update<CR>", "Lazy upadate" },

    ["<leader>mm"] = { "<cmd>lua require('treesj').toggle()<CR>", "toogle array" },

    ["<leader>aa"] = { "<cmd> :lua require('harpoon.mark').add_file() <CR>", "add harpoon" },
    ["<C-e>"] = { "<cmd> :lua require('harpoon.ui').toggle_quick_menu() <CR>", "harpoon ui" },
    ["<leader>ar"] = { "<cmd> :lua require('runpoon.mark').add_file() <CR>", "add runpoon" },
    ["<C-S-e>"] = { "<cmd> :lua require('runpoon.ui').toggle_quick_menu() <CR>", "runpoon ui" },

    ["<A-f>"] = { "<cmd> :lua require('harpoon.ui').nav_file(1) <CR>", "Harpoon switch 1" },
    ["<A-d>"] = { "<cmd> :lua require('harpoon.ui').nav_file(2) <CR>", "Harpoon switch 2" },
    ["<A-s>"] = { "<cmd> :lua require('harpoon.ui').nav_file(3) <CR>", "Harpoon switch 3" },
    ["<A-a>"] = { "<cmd> :lua require('harpoon.ui').nav_file(4) <CR>", "Harpoon switch 4" },

    ["<A-m>"] = { "<cmd> :lua require('runpoon.ui').run_file(1) <CR>", "runpoon run file 1" },
    ["<A-,>"] = { "<cmd> :lua require('runpoon.ui').run_file(2) <CR>", "runpoon run file 2" },
    ["<A-.>"] = { "<cmd> :lua require('runpoon.ui').run_file(3) <CR>", "runpoon run file 3" },
    ["<A-/>"] = { "<cmd> :lua require('runpoon.ui').run_file(4) <CR>", "runpoon run file 4" },

    -- fd '^*.sh$' -t f -d 1 .run | fzf
    ["<leader>rt"] = {
      -- "<cmd> :Telescope find_files find_command=rg,--hidden,--ignore,--files,--glob,**/.run/*.sh layout_strategy=vertical layout_config={width=0.2,height=0.3} <CR>",
      function()
        -- Use Telescope to find .sh files in the .run directory
        require("telescope.builtin").find_files {
          find_command = { "rg", "--hidden", "--ignore", "--files", "--glob", "**/.run/*.sh" },
          layout_strategy = "vertical",
          layout_config = { width = 0.2, height = 0.3 },
          attach_mappings = function(prompt_bufnr, _)
            local action_state = require "telescope.actions.state"
            local actions = require "telescope.actions"

            -- Define custom action for selection
            local function on_selection()
              local selected = action_state.get_selected_entry()

              -- Check if a file is selected
              if not selected or not selected.value then
                vim.notify "No file selected."
                actions.close(prompt_bufnr)
                return
              end

              local filename = selected.value

              -- Close the Telescope window
              actions.close(prompt_bufnr)

              -- Notify the user which file is being run
              vim.notify("Running " .. filename)

              -- Run the file in a terminal using nvterm
              require("nvterm.terminal").send("bash " .. filename, "horizontal")
            end

            -- Bind custom action to Enter key
            actions.select_default:replace(on_selection)
            return true
          end,
        }
      end,
      "telescope file in .run",
    },

    -- Upload current buffer
    ["<leader>ub"] = { "<cmd> :TransferUpload <CR>", "Upload current buffer file to configured CWD server" },
    ["<leader>gu"] = {
      function()
        -- get all selected file path in nvimtree
        local selectedfiles = require("nvim-tree.lib").get_node_at_cursor().absolute_path
        print(selectedfiles)

        --debug
      end,
      "Upload selection to server from nvimtree",
    },
    ["<leader>up"] = {
      function()
        vim.cmd("TransferUpload " .. vim.fn.getcwd())
      end,
      "Upload project",
    },

    -- Generate lang docs
    ["<leader>rd"] = { "<cmd> :lua require('neogen').generate()<CR>", "Generate lang docs" },

    -- ["<Tab-l>"] = {
    --   function()
    --     require("nvchad.tabufline").tabuflineNext()
    --   end,
    --   "Goto next buffer",
    -- },
    -- ["<Tab-h>"] = {
    --   function()
    --     require("nvchad.tabufline").tabuflinePrev()
    --   end,
    --   "Goto prev buffer",
    -- },

    ["<leader>fu"] = { "<cmd> Telescope undo <CR> ", "Find in undo tree" },
    ["<leader>j"] = { "<cmd> :normal! zz <CR>", "Center buffer on cursor" },
    ["<leader>;"] = { "A;<esc>" },
    ["<leader>,"] = { "A,<esc>" },
    ["<leader>p"] = { '"1p', "paste what you overrode with paste" },
    ["<leader>ct"] = { "<cmd> lua require('chatgpt') <CR><cmd> ChatGPT <CR>", "Open ChatGPT prompts" },

    ["<leader>l"] = { "zf", "fold" },
    ["<leader>k"] = { "za", "toggle fold" },
  },
}

M.comment = {
  plugin = true,

  -- toggle comment in both modes
  n = {
    ["<C-/>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
  },

  v = {
    ["<C-/>"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
  },
}

M.git = {
  n = {
    ["<leader>gc"] = { "<cmd>Telescope git_commits<CR>", "  Git commits" },
    ["<leader>gb"] = { "<cmd>Telescope git_branches<CR>", "  Git branches" },
    ["<leader>gs"] = { "<cmd>AdvancedGitSearch<CR>", "  Advanced Search" },
    ["<leader>gg"] = { "<cmd>LazyGit<CR>", "  LazyGit" },
    ["<leader>gl"] = {
      function()
        package.loaded.gitsigns.blame_line()
      end,
      "  Blame line",
    },
    ["<leader>gvd"] = { "<cmd> DiffviewOpen<CR>", "  Show git diff" },
    ["<leader>gvf"] = { "<cmd> DiffviewFileHistory %<CR>", "  Show file history" },
    ["<leader>gvp"] = { "<cmd> DiffviewOpen --cached<CR>", "  Show staged diffs" },
    ["<leader>gvr"] = { "<cmd> DiffviewRefresh<CR>", "  Refresh diff view" },
    ["<leader>gvc"] = { "<cmd> DiffviewClose<CR>", "  Close diff view" },
    ["<leader>gbd"] = {
      function()
        -- display prompt to comfirm the deletion of the current branch
      end,
      "  delete current branch (local and remote)",
    },
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<leader>fk"] = { "<cmd>Telescope keymaps<CR>", " Find keymaps" },
    ["<leader>."] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["<leader>fd"] = {
      "<cmd> Telescope find_files follow=true no_ignore=true hidden=true cwd=~/dotfiles_telescope/ depth=1<CR>",
      "Find dotfiles",
    },
    ["<leader>o"] = { "<cmd> FzfLua files cwd=~ <CR>", "Find all" },
    ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
    ["<leader>/"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },

    ["cd"] = { "<cmd> Telescope file_browser <CR>", "file browser in cwd" },

    ["<leader>fp"] = { "<cmd> Telescope projects <CR>", "Find projects" },

    -- git
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status" },

    -- pick a hidden term
    ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "Pick hidden term" },

    -- theme switcher
    ["<leader>th"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },

    ["<leader>ma"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },
    ["<leader>fn"] = { "<cmd> Telescope notify <CR>", "Find Notifications" },
  },
}

-- M.tabufline = {
--   plugin = true,
--
--   n = {
--     -- close buffer + hide terminal buffer
--     ["<C-x>"] = {
--       function()
--         require("nvchad_ui.tabufline").close_buffer()
--       end,
--       " Close buffer",
--     },
--   },
-- }

M.session = {
  n = {
    ["<leader>sl"] = {
      function()
        require("nvim-possession").list()
      end,
      " List session",
    },
    ["<leader>sn"] = {
      function()
        require("nvim-possession").new()
      end,
      " New session",
    },
    ["<leader>su"] = {
      function()
        require("nvim-possession").update()
      end,
      " Update session",
    },
    ["<leader>sd"] = {
      function()
        require("nvim-possession").delete()
      end,
      " Delete session",
    },
  },
}

M.diagnostics = {
  n = {
    ["<leader>t"] = { "<cmd>Trouble diagnostics toggle<cr>", "Diagnostics (Trouble)" },
    ["<leader>tb"] = { "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "Buffer Diagnostics (Trouble)" },
    ["<leader>td"] = { "<cmd>TodoTrouble keywords=TODO,FIX,FIXME,BUG,TEST,NOTE<cr>", " Todo/Fix/Fixme" },
  },
}

M.todo = {
  n = {
    ["<leader>ft"] = { "<cmd>TodoTelescope<cr>", " Todo/Fix/Fixme" },
  },
}

M.refactoring = {
  x = {
    ["<leader>re"] = { "<cmd> :Refactor extract <CR>", "" },
    ["<leader>rf"] = { "<cmd> :Refactor extract_to_file <CR>", "" },
    ["<leader>rv"] = { "<cmd> :Refactor extract_var <CR>", "" },
  },
  n = {
    -- ["<leader>ri"] = { "<cmd> :Refactor inline_var <CR>", "" },
    -- ["<leader>rI"] = { "<cmd> :Refactor inline_func <CR>", "" },
    -- ["<leader>rb"] = { "<cmd> :Refactor extract_block <CR>", "" },
    -- ["<leader>rbf"] = { "<cmd> :Refactor extract_block_to_file <CR>", "" },
  },
}

M.octo = {
  n = {
    ["<leader>gpl"] = { "<cmd> :Octo pr list <CR><CR>", "🐙 Octo - List all pull requests" },
    ["<leader>gpc"] = { "<cmd> :Octo pr create <CR>", "🐙 Octo - Create a pull request" },
    ["<leader>vv"] = { "<cmd> :Octo review <CR>", "🐙 Octo - Start or resume a review" },
  },
}

M.muren = {
  n = {
    ["<leader>re"] = { "<cmd> :MurenToggle<CR>", "Toggle muren UI" },
  },
}

M.spectre = {
  n = {
    ["<leader>S"] = { "<cmd>lua require('spectre').toggle()<CR>", "Toggle Spectre" },
    -- ["<leader>ss"] = { "<cmd>lua require('spectre').open_visual({=true})<CR>", "Search current selection" },
    ["<leader>sw"] = { "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", "Search current word" },
    ["<leader>sp"] = {
      "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>",
      "Search on current file",
    },
  },
  v = {
    ["<leader>sw"] = { "<esc><cmd>lua require('spectre').open_visual()<CR>", "Search current word" },
  },
}

local databaseUI = "<cmd> :DBUIToggle<CR>"
M.dadbod = {
  n = {
    ["<leader>db"] = { databaseUI, "Toggle Dadbod UI" },
    -- ["<leader>dc"] = { databaseUI .. "3j <CR>", "" },
    -- ["<leader>dt"] = function()
    --   -- telescope through tables
    -- end,
  },
}

M.executor = {
  n = {
    ["<leader>rr"] = { "<cmd> :lua require('executor').executor()<CR>", "Run code of current buffer" },
    -- ["<leader>rc"] = { "<cmd> :lua require('executor').term_closer()<CR>", "Close all terminal windows" },
  },
}

M.dap = {
  n = {
    ["<leader>dd"] = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "Toggle breakpoint" },
    ["<leader>dc"] = { "<cmd>lua require'dapui'.close()<CR>", "close dapui" },
    ["<leader>dm"] = { "<cmd>DapContinue<CR>", "DAP continue" },
    ["C-<down>"] = { "<cmd>DapStepInto<CR>", "DAP stepInto" },
    ["<leader>dk"] = { "<cmd>DapStepOut<CR>", "DAP Step Out" },
    ["C-<right>"] = { "<cmd>DapStepOver<CR>", "DAP Step Over" },

    ["<leader>da"] = { "<cmd>lua require('dapui').elements.watches.add()<CR>", "DAP watcher add" },
    ["<leader>dr"] = { "<cmd>lua require('dapui').elements.watches.remove()<CR>", "DAP watcher remove" },
    ["<leader>de"] = { "<cmd>lua require('dapui').elements.watches.edit()<CR>", "DAP watcher edit" },
  },
}

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set
keymap({ "n", "v" }, "<Leader>cb", "<Cmd>CBccbox<CR>", opts)
keymap({ "n", "v" }, "<Leader>ct", "<Cmd>CBllline<CR>", opts)
keymap("n", "<Leader>cl", "<Cmd>CBline<CR>", opts)
keymap({ "n", "v" }, "<Leader>cm", "<Cmd>CBllbox14<CR>", opts)
keymap({ "n", "v" }, "<Leader>cd", "<Cmd>CBd<CR>", opts)

return M
