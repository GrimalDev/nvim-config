require "nvchad.mappings"

local map = vim.keymap.set

local s = {} -- sections definitions

s.disabled = {
  n = {
    { "<Left>", "" },
    { "<Right>", "" },
  },
  i = {
    { "<Left>", "" },
    { "<Right>", "" },
  },
}

-- map({ "n", "i", "v" }, "<C-s>", "<CMD> w <cr>")

s.textobjs = {
  o = {
    { "as", '<CMD>lua require("various-textobjs").subword("outer")<CR>', { desc = "Select a subword" } },
    { "is", '<CMD>lua require("various-textobjs").subword("inner")<CR>', { desc = "Select inner subword" } },
    { "ac", '<CMD>lua require("various-textobjs").cssColor("outer")<CR>', { desc = "Select a css color" } },
    { "ic", '<CMD>lua require("various-textobjs").cssColor("inner")<CR>', { desc = "Select inner css color" } },
    { "aN", '<CMD>lua require("various-textobjs").number("outer")<CR>', { desc = "Select a number" } },
    { "iN", '<CMD>lua require("various-textobjs").number("inner")<CR>', { desc = "Select inner number" } },
    {
      "aa",
      '<CMD>lua require("various-textobjs").indentation("outer", "outer")<CR>',
      { desc = "Select a indentation" },
    },
    { "o", "iw", { desc = "iw" } },
    { "O", '<CMD>lua require("various-textobjs").subword("inner")<CR>', { desc = "inner subword" } },
    { "q", '<CMD>lua require("various-textobjs").toNextQuotations.rk()<CR>', { desc = "to next quotation mark" } },
    { "'", '<CMD>lua require("various-textobjs").anyQuote("inner")<CR>', { desc = "inner any quote" } },
    { "[", '<CMD>lua require("various-textobjs").anyBracket("inner")<CR>', { desc = "inner any bracket" } },
  },
  x = {
    { "as", '<CMD>lua require("various-textobjs").subword("outer")<CR>', { desc = "Select a subword" } },
    { "is", '<CMD>lua require("various-textobjs").subword("inner")<CR>', { desc = "Select inner subword" } },
    { "ac", '<CMD>lua require("various-textobjs").cssColor("outer")<CR>', { desc = "Select a css color" } },
    { "ic", '<CMD>lua require("various-textobjs").cssColor("inner")<CR>', { desc = "Select inner css color" } },
    { "aN", '<CMD>lua require("various-textobjs").number("outer")<CR>', { desc = "Select a number" } },
    { "iN", '<CMD>lua require("various-textobjs").number("inner")<CR>', { desc = "Select inner number" } },
    {
      "aa",
      '<CMD>lua require("various-textobjs").indentation("outer", "outer")<CR>',
      { desc = "Select a indentation" },
    },
    { "o", "iw", { desc = "iw" } },
    { "O", '<CMD>lua require("various-textobjs").subword("inner")<CR>', { desc = "inner subword" } },
    { "q", '<CMD>lua require("various-textobjs").toNextQuotations.rk()<CR>', { desc = "to next quotation mark" } },
    { "'", '<CMD>lua require("various-textobjs").anyQuote("inner")<CR>', { desc = "inner any quote" } },
    { "[", '<CMD>lua require("various-textobjs").anyBracket("inner")<CR>', { desc = "inner any bracket" } },
  },
  v = {
    { "r", "r", { desc = "Replace" } },
  },
}

s.text = {
  i = {
    { "<C-Up>", "<CMD> :m-2<CR>", { desc = " s.ve up" } },
    { "<C-Down>", "<CMD> :m+<CR>", { desc = " s.ve down" } },
  },
  n = {
    { "<C-Up>", "<CMD> :m-2<CR>", { desc = " s.ve up" } },
    { "<C-Down>", "<CMD> :m+<CR>", { desc = " s.ve down" } },
    {
      "<Down>",
      "<cmd>lua require('nvim-treesitter.textobjects.move').goto_next_start('@function.outer')<CR>",
      { desc = "Move to next function" },
    },
    {
      "<Up>",
      "<cmd>lua require('nvim-treesitter.textobjects.move').goto_previous_start('@function.outer')<CR>",
      { desc = "Move to previous function" },
    },
  },

  c = {
    { "<C-k>", "<C-p>", { desc = "nav prev " } },
    { "<C-j>", "<C-n>", { desc = "nav next " } },
  },
}

s.harpoon = {
  n = {
    { "<leader>ma", "<CMD> :lua require('harpoon'):list():replace_at(4) <CR>", { desc = "replace harpoon 4" } },
    { "<leader>ms", "<CMD> :lua require('harpoon'):list():replace_at(3) <CR>", { desc = "replace harpoon 3" } },
    { "<leader>md", "<CMD> :lua require('harpoon'):list():replace_at(2) <CR>", { desc = "replace harpoon 2" } },
    { "<leader>mf", "<CMD> :lua require('harpoon'):list():replace_at(1) <CR>", { desc = "replace harpoon 1" } },

    { "<A-f>", "<CMD> lua require('harpoon'):list():select(1) <CR>", { desc = "Harpoon switch 1" } },
    { "<A-d>", "<CMD> lua require('harpoon'):list():select(2) <CR>", { desc = "Harpoon switch 2" } },
    { "<A-s>", "<CMD> lua require('harpoon'):list():select(3) <CR>", { desc = "Harpoon switch 3" } },
    { "<A-a>", "<CMD> lua require('harpoon'):list():select(4) <CR>", { desc = "Harpoon switch 4" } },

    { "<leader>aa", "<CMD> lua require('harpoon'):list():add() <CR>", { desc = "add harpoon" } },
    {
      "<C-e>",
      function()
        local harpoon = require "harpoon"
        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
          local file_paths = {}
          for _, item in ipairs(harpoon_files.items) do
            table.insert(file_paths, item.value)
          end

          require("telescope.pickers")
            .new({}, {
              prompt_title = "Harpoon",
              finder = require("telescope.finders").new_table {
                results = file_paths,
              },
              previewer = conf.file_previewer {},
              sorter = conf.generic_sorter {},
            })
            :find()
        end
        toggle_telescope(harpoon:list())
      end,
      { desc = "harpoon ui" },
    },
  },
}

s.runpoon = {
  n = {
    { "<leader>ar", "<CMD> lua require('runpoon.mark').add_file() <CR>", { desc = "add runpoon" } },
    -- { "<C-r>", "<CMD> lua require('runpoon.ui').toggle_quick_menu() <CR>", { desc = "runpoon ui" } },

    { "<A-m>", "<CMD> lua require('runpoon.ui').run_file(1) <CR>", { desc = "runpoon run file 1" } },
    { "<A-,>", "<CMD> lua require('runpoon.ui').run_file(2) <CR>", { desc = "runpoon run file 2" } },
    { "<A-.>", "<CMD> lua require('runpoon.ui').run_file(3) <CR>", { desc = "runpoon run file 3" } },
    { "<A-/>", "<CMD> lua require('runpoon.ui').run_file(4) <CR>", { desc = "runpoon run file 4" } },
  },
}

s.general = {
  i = {
    { "<A-r>", "<CMD> tabnew<CR>", { desc = "New tab" } },
    { "<C-h>", "<Backspace>", { desc = "Backspace" } },

    { "<A-f>", "<CMD> :lua require('harpoon.ui').nav_file(1) <CR>", { desc = "Harpoon switch 1" } },
    { "<A-d>", "<CMD> :lua require('harpoon.ui').nav_file(2) <CR>", { desc = "Harpoon switch 2" } },
    { "<A-s>", "<CMD> :lua require('harpoon.ui').nav_file(3) <CR>", { desc = "Harpoon switch 3" } },
    { "<A-a>", "<CMD> :lua require('harpoon.ui').nav_file(4) <CR>", { desc = "Harpoon switch 4" } },
    { "<C-s>", "<CMD> w <CR>", { desc = "Save file" } },
    { "<A-C-s>", "<CMD> noautocmd w <CR>", { desc = "Save file without autocmd" } },

    -- {"<C-g>", "<CMD> :Copilot suggestion accept <CR>", { desc = "Acccept Copilot suggestion" } },
  },

  n = {
    {
      "j",
      'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',
      { expr = true, desc = "Move down (respects wrapped lines)" },
    },
    {
      "k",
      'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',
      { expr = true, desc = "Move up (respects wrapped lines)" },
    },
    -- Comment box commands
    { "<Leader>cb", "<CMD>CBccbox<CR>", { desc = "Comment centered box" } },
    { "<Leader>ct", "<CMD>CBllline<CR>", { desc = "Comment line" } },
    { "<Leader>cl", "<CMD>CBline<CR>", { desc = "Comment single line" } },
    { "<Leader>cm", "<CMD>CBllbox14<CR>", { desc = "Comment box (medium)" } },
    { "<Leader>cd", "<CMD>CBd<CR>", { desc = "Delete comment box" } },

    -- Window resize in normal mode
    { "<F9>", "<C-w><", { desc = "Decrease width" } },
    { "<F10>", "<C-w>>", { desc = "Increase width" } },
    { "<F11>", "<C-w>+", { desc = "Increase height" } },
    { "<F12>", "<C-w>-", { desc = "Decrease height" } },

    -- Window navigation
    { "<C-h>", "<C-w>h", { desc = "Window left" } },
    { "<C-l>", "<C-w>l", { desc = "Window right" } },
    { "<C-j>", "<C-w>j", { desc = "Window down" } },
    { "<C-k>", "<C-w>k", { desc = "Window up" } },
    -- { "<C-h>", "<cmd>NvimTmuxNavigateLeft<cr>", { desc = "Window left" } },
    -- { "<C-l>", "<cmd>NvimTmuxNavigateRight<cr>", { desc = "Window right" } },
    -- { "<C-j>", "<cmd>NvimTmuxNavigateDown<cr>", { desc = "Window down" } },
    -- { "<C-k>", "<cmd>NvimTmuxNavigateUp<cr>", { desc = "Window up" } },

    { "<A-x>", "<C-w>c", { desc = "Window close" } },

    { "<A-e>", "<CMD> qa<CR>", { desc = "Exit" } },

    { "<A-r>", "<CMD> tabnew<CR>", { desc = "New tab" } },

    -- {
    --   "<right>",
    --   function()
    --     require("nvchad.tabufline").next()
    --   end,
    --   { desc = "Goto next buffer" },
    -- },
    -- {
    --   "<left>",
    --   function()
    --     require("nvchad.tabufline").prev()
    --   end,
    --   { desc = "Goto prev buffer" },
    -- },

    { "<leader>uu", "<CMD> Lazy update<CR>", { desc = "Lazy upadate" } },

    { "<leader>mm", "<CMD>lua require('treesj').toggle()<CR>", { desc = "toogle array" } },

    {
      "<leader>rt",
      function()
        require("telescope.builtin").find_files {
          find_command = { "fd", "-t", "f", ".", ".run" },
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

              actions.close(prompt_bufnr)

              vim.notify("Running " .. filename)

              local goal_bufnr = vim.fn.bufadd(filename)
              if goal_bufnr == -1 then
                print("Could not find file: " .. filename)
                return
              end

              -- Ensure the buffer is loaded
              if not vim.api.nvim_buf_is_loaded(goal_bufnr) then
                vim.fn.bufload(goal_bufnr)
              end

              -- local origin_bufnr = vim.api.nvim_get_current_buf()
              vim.api.nvim_set_current_buf(goal_bufnr)
              vim.cmd("lua require('runner').run(" .. goal_bufnr .. ")")
              -- if in split view, return to origin buffer on the other split
              -- if vim.fn.winnr "$" > 1 then
              --   vim.cmd "wincmd h"
              --   vim.api.nvim_set_current_buf(origin_bufnr)
              --   vim.cmd "wincmd l"
              -- end
            end

            -- Bind custom action to Enter key
            actions.select_default:replace(on_selection)
            return true
          end,
        }
      end,
      { desc = "telescope file in .run" },
    },

    -- Upload current buffer
    {
      "<leader>ub",
      "<CMD> :TransferUpload <CR>",
      { desc = "Upload current buffer file to configured CWD server" },
    },
    {
      "<leader>gu",
      function()
        -- get all selected file path in nvimtree
        local selectedfiles = require("nvim-tree.lib").get_node_at_cursor().absolute_path
        print(selectedfiles)

        --debug
      end,
      { desc = "Upload selection to server from nvimtree" },
    },
    {
      "<leader>up",
      function()
        vim.cmd("TransferUpload " .. vim.fn.getcwd())
      end,
      { desc = "Upload project" },
    },
    {
      "<leader>ug",
      function()
        for _, file in ipairs(vim.fn.systemlist "git diff --name-only") do
          vim.cmd("TransferUpload " .. file)
        end
      end,
      { desc = "Upload git changed files" },
    },

    -- Generate lang docs
    { "<leader>rd", "<CMD> :lua require('neogen').generate()<CR>", { desc = "Generate lang docs" } },

    -- {{ desc = "<Tab-l>" },
    --   function()
    --     require("nvchad.tabufline").tabuflineNext()
    --   end,
    --   "Goto next buffer",
    -- },
    -- {{ desc = "<Tab-h>" },
    --   function()
    --     require("nvchad.tabufline").tabuflinePrev()
    --   end,
    --   "Goto prev buffer",
    -- },

    { "<leader>fu", "<CMD> UndotreeToggle <CR> ", { desc = "Find in undo tree" } },
    { "<leader>j", "<CMD> :normal! zz <CR>", { desc = "Center buffer on cursor" } },
    { "<leader>;", "A;<esc>" },
    { "<leader>,", "A,<esc>" },
    {
      "<leader>p",
      '"1p',
      { desc = "paste what you overrode with paste" },
    },
    { "<leader>ct", "<CMD> lua require('chatgpt') <CR><CMD> ChatGPT <CR>", { desc = "Open ChatGPT prompts" } },

    { "<tab>", "<C-i>", { desc = "not last position" } },
    {
      "<leader>ra",
      "<CMD>lua require('renamer').rename()<CR>",
      { desc = "LSP rename" },
    },
    {
      "<leader>ca",
      function()
        require("tiny-code-action").code_action {}
      end,
      { desc = "LSP code action" },
    },
    { "<leader>x", "<CMD>Bdelete<CR>", { desc = "Close buffer" } },
  },
  v = {
    -- Comment box commands for visual mode
    { "<Leader>cb", "<CMD>CBccbox<CR>", { desc = "Comment centered box" } },
    { "<Leader>ct", "<CMD>CBllline<CR>", { desc = "Comment line" } },
    { "<Leader>cm", "<CMD>CBllbox14<CR>", { desc = "Comment box (medium)" } },
    { "<Leader>cd", "<CMD>CBd<CR>", { desc = "Delete comment box" } },

    { "p", '"_dP', { desc = "Override default paste" } },
    { "<leader>p", "p", { desc = "Default paste" } },

    -- Move selected lines up and down
    { "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" } },
    { "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" } },
  },
}

s.comment = {
  -- toggle comment in both modes
  n = {
    {
      "<C-/>",
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      { desc = "Toggle comment" },
    },
  },

  v = {
    {
      "<C-/>",
      "<ESC><CMD>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      { desc = "Toggle comment" },
    },
  },
}

s.git = {
  n = {
    { "<leader>gc", "<CMD>Telescope git_commits<CR>", { desc = "  Git commits" } },
    { "<leader>gb", "<CMD>Telescope git_branches<CR>", { desc = "  Git branches" } },
    { "<leader>gs", "<CMD>AdvancedGitSearch<CR>", { desc = "  Advanced Search" } },
    { "<leader>gg", "<CMD>LazyGit<CR>", { desc = "  LazyGit" } },
    {
      "<leader>gl",
      function()
        package.loaded.gitsigns.blame_line()
      end,
      { desc = "  Blame line" },
    },
  },
}

s.flutter = {
  n = { { "<leader>fl", "<cmd> Telescope flutter commands <CR>", { desc = "Flutter commands" } } },
}

s.telescope = {
  n = {
    -- find
    { "<leader>fk", "<CMD>Telescope keymaps<CR>", { desc = " Find keymaps" } },
    {
      "<leader>fa",
      "<CMD> Telescope find_files workspace=CWD follow=true no_ignore=true hidden=true <CR>",
      { desc = "Find all" },
    },
    {
      "<leader>.",
      "<CMD> Telescope find_files<CR>",
      { desc = "Find all" },
    },
    {
      "<leader>ff",
      "<CMD> :Telescope frecency workspace=CWD <CR>",
      { desc = "Find all with frequency order" },
    },
    { "<leader>o", "<CMD> FzfLua files cwd=~ <CR>", { desc = "Find all" } },
    { "<leader>fw", "<CMD> Telescope live_grep <CR>", { desc = "Live grep" } },
    { "<leader>b", "<CMD> Telescope buffers <CR>", { desc = "Find buffers" } },
    { "<leader>fh", "<CMD> Telescope help_tags <CR>", { desc = "Help page" } },
    { "<leader>fo", "<CMD> Telescope oldfiles <CR>", { desc = "Find oldfiles" } },
    { "<leader>/", "<CMD> Telescope current_buffer_fuzzy_find <CR>", { desc = "Find in current buffer" } },

    { "cd", "<CMD> Telescope file_browser <CR>", { desc = "file browser in cwd" } },

    { "<leader>fp", "<CMD> Telescope projects <CR>", { desc = "Find projects" } },

    -- git
    { "<leader>cm", "<CMD> Telescope git_commits <CR>", { desc = "Git commits" } },
    { "<leader>gt", "<CMD> Telescope git_status <CR>", { desc = "Git status" } },

    -- pick a hidden term
    { "<leader>pt", "<CMD> Telescope terms <CR>", { desc = "Pick hidden term" } },

    -- theme switcher
    {
      "<leader>th",
      function()
        require("nvchad.themes").open()
      end,
      { desc = "Nvchad themes" },
    },

    { "<leader>fn", "<CMD> Noice telescope <CR>", { desc = "Find Notifications" } },

    --compare two files

    {
      "<leader>fc",
      function()
        require("telescope").extensions.diff.diff_current { hidden = true }
      end,
      { desc = "Compare/Dif current file with a file" },
    },
    {
      "<leader>fC",
      function()
        require("telescope").extensions.diff.fiff_files { hidden = true }
      end,
      { desc = "Compare/Dif any file with any other file" },
    },
    { "<leader><leader>", "<cmd>Telescope cmdline<cr>", { desc = "Fzf commands" } },
  },
  v = {
    {
      "<leader>fw",
      function()
        local visual_selection = require("telescope.utils").get_visual_selection()
        require("telescope.builtin").live_grep {
          default_text = visual_selection,
        }
      end,
      { desc = "Live grep with visual selection" },
    },
  },
}

s.lsp = {
  n = {
    { "gd", "<CMD>Telescope lsp_definitions<CR>", { desc = "Go to lsp definitions" } },
    { "gr", "<CMD>Telescope lsp_references<CR>", { desc = "Go to lsp references" } },
  },
}

s.session = {
  n = {
    {
      "<leader>sl",
      "<CMD>SessionSearch<CR>",
      { desc = " List session" },
    },
    {
      "<leader>sn",
      "<CMD>SessionSave<CR>",
      { desc = " New session" },
    },
    -- {
    --   "<leader>su",
    --   function()
    --     require("nvim-possession").update()
    --   end,
    --   { desc = " Update session" },
    -- },
    {
      "<leader>sd",
      "<CMD>SessionDelete<CR>",
      { desc = " Delete session" },
    },
  },
}

s.diagnostics = {
  n = {
    { "<leader>t", "<CMD>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" } },
    { "<leader>tb", "<CMD>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" } },
    { "<leader>td", "<CMD>TodoTrouble keywords=TODO,FIX,FIXs.,BUG,TEST,NOTE<cr>", { desc = " Todo/Fix/Fixme" } },
  },
}

s.todo = {
  n = {
    { "<leader>ft", "<CMD>TodoTelescope<cr>", { desc = " Todo/Fix/Fixme" } },
  },
}

s.refactoring = {
  x = {
    { "<leader>re", "<CMD> :Refactor extract <CR>", { desc = "" } },
    { "<leader>rf", "<CMD> :Refactor extract_to_file <CR>", { desc = "" } },
    { "<leader>rv", "<CMD> :Refactor extract_var <CR>", { desc = "" } },
  },
  -- n = {
  -- {"<leader>ri", "<CMD> :Refactor inline_var <CR>", { desc = "" } },
  -- {"<leader>rI", "<CMD> :Refactor inline_func <CR>", { desc = "" } },
  -- {"<leader>rb", "<CMD> :Refactor extract_block <CR>", { desc = "" } },
  -- {"<leader>rbf", "<CMD> :Refactor extract_block_to_file <CR>", { desc = "" } },
  -- },
}

s.octo = {
  n = {
    { "<leader>gpl", "<CMD> Octo pr list <CR><CR>", { desc = "🐙 Octo - List all pull requests" } },
    { "<leader>gpc", "<CMD> Octo pr create <CR>", { desc = "🐙 Octo - Create a pull request" } },
    { "<leader>vv", "<CMD> Octo review <CR>", { desc = "🐙 Octo - Start or resume a review" } },
    { "<leader>sv", "<CMD> Octo review submit <CR>", { desc = "🐙 Octo - Submit a review" } },
    { "<leader>mg", "<CMD> Octo pr merge delete <CR>", { desc = "🐙 Octo - Merge a pr and delete branch" } },
  },
}

s.muren = {
  n = {
    { "<leader>re", "<CMD> :s.renToggle<CR>", { desc = "Toggle muren UI" } },
  },
}

s.spectre = {
  n = {
    {
      "<leader>S",
      "<CMD>lua require('spectre').toggle()<CR>",
      { desc = "Toggle Spectre" },
    },
    -- {"<leader>ss", "<CMD>lua require('spectre').open_visual({=true})<CR>", { desc = "Search current selection" } },
    {
      "<leader>sw",
      "<CMD>lua require('spectre').open_visual({select_word=true})<CR>",
      { desc = "Search current word" },
    },
    {
      "<leader>sp",
      "<CMD>lua require('spectre').open_file_search({select_word=true})<CR>",
      { desc = "Search on current file" },
    },
  },
  v = {
    { "<leader>sw", "<esc><CMD>lua require('spectre').open_visual()<CR>", { desc = "Search current word" } },
  },
}

s.dadbod = {
  n = {
    { "<leader>db", "<CMD> :DBUIToggle<CR>", { desc = "Toggle Dadbod UI" } },
  },
}

s.runner = {
  n = {
    { "<leader>rr", "<cmd>lua require('runner').run() <CR>", { desc = "Run code of current buffer" } },
    -- {"<leader>rc", "<CMD> :lua require('executor').term_closer()<CR>", { desc = "Close all terminal windows" } },
  },
}

s.zen = {
  n = {
    {
      "<leader>z",
      function()
        require("zen-mode").toggle()
      end,
      { desc = "Zen mode" },
    },
  },
}

s.dap = {
  n = {
    { "<leader>dd", "<CMD>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Toggle breakpoint" } },
    { "<leader>dc", "<CMD>lua require'dapui'.close()<CR>", { desc = "close dapui" } },
    { "<leader>dm", "<CMD>DapContinue<CR>", { desc = "DAP continue" } },
    { "<down>", "<CMD>DapStepInto<CR>", { desc = "DAP stepInto" } },
    { "<leader>dk", "<CMD>DapStepOut<CR>", { desc = "DAP Step Out" } },
    { "<up>", "<CMD>DapStepOver<CR>", { desc = "DAP Step Over" } },

    { "<leader>da", "<CMD>lua require('dapui').elements.watches.add()<CR>", { desc = "DAP watcher add" } },
    { "<leader>dr", "<CMD>lua require('dapui').elements.watches.remove()<CR>", { desc = "DAP watcher remove" } },
    { "<leader>de", "<CMD>lua require('dapui').elements.watches.edit()<CR>", { desc = "DAP watcher edit" } },
  },
}

s.colorutils = {
  n = {
    { "<leader>cp", "<CMD> Colortils <CR>", { desc = "Color picker" } },
    { "<leader>cl", "<CMD> Colortils lighten <CR>", { desc = "Color lighten" } },
    { "<leader>cd", "<CMD> Colortils darken <CR>", { desc = "Color darken" } },
  },
}

s.fold = {
  n = {
    { "<leader>l", "zA", { desc = "Create fold" } },
    { "<leader>k", "za", { desc = "Toggle fold" } },
    { "<leader>K", "zRzz", { desc = "Open all folds" } },
    { "<leader>L", "zM", { desc = "Close all folds" } },
    { "<leader>h", "zMzAzz", { desc = "Close all folds but current one" } },
    { "[", "zj", { desc = "Move to next fold", noremap = true, nowait = true } },
    { "]", "zk", { desc = "Move to previous fold", noremap = true, nowait = true } },
  },
}

for _, section in pairs(s) do
  for modes, mappings in pairs(section) do
    for _, mapping in pairs(mappings) do
      map(modes, mapping[1], mapping[2], mapping[3])
    end
  end
end
