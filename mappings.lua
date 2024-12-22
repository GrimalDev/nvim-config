require "nvchad.mappings"

local map = vim.keymap.set

local s = {} -- sections definitions

-- s.disabled = {
-- 	{"z", ""},
-- 	{"f", ""},
-- 	{"<C-u>", ""},
-- 	{"<C-q>", ""},
-- }

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- VARIOUS TEXT OBJECTS --
map({ "o", "x" }, "as", '<cmd>lua require("various-textobjs"),subword("outer")<CR>', { desc = "Select a subword" })
map({ "o", "x" }, "is", '<cmd>lua require("various-textobjs"),subword("inner")<CR>', { desc = "Select inner subword" })
map({ "o", "x" }, "ac", '<cmd>lua require("various-textobjs"),cssColor("outer")<CR>', { desc = "Select a css color" })
map(
  { "o", "x" },
  "ic",
  '<cmd>lua require("various-textobjs"),cssColor("inner")<CR>',
  { desc = "Select inner css color" }
)
map({ "o", "x" }, "aN", '<cmd>lua require("various-textobjs").number("outer")<CR>', { desc = "Select a number" })
map({ "o", "x" }, "iN", '<cmd>lua require("various-textobjs").number("inner")<CR>', { desc = "Select inner number" })
map(
  { "o", "x" },
  "aa",
  '<cmd>lua require("various-textobjs").indentation("outer", "outer")<CR>',
  { desc = "Select a indentation" }
)
map({ "o", "x" }, "o", "iw", { desc = "iw" })
map({ "o", "x" }, "O", '<cmd>lua require("various-textobjs").subword("inner")<CR>', { desc = "inner subword" })
map(
  { "o", "x" },
  "q",
  '<cmd>lua require("various-textobjs").toNextQuotations.rk()<CR>',
  { desc = "to next to next quotation mark" }
)
map({ "o", "x" }, "'", '<cmd>lua require("various-textobjs").anyQuote("inner")<CR>', { desc = "inner any quote" })
map({ "o", "x" }, "[", '<cmd>lua require("various-textobjs").anyBracket("inner")<CR>', { desc = "inner any bracket" })
map({ "v" }, "r", "r")
-- END --
--

s.text = {
  i = {
    { "<C-Up>", "<cmd> :m-2<CR>", { desc = " s.ve up" } },
    { "<C-Down>", "<cmd> :m+<CR>", { desc = " s.ve down" } },
  },
  n = {
    { "<C-Up>", "<cmd> :m-2<CR>", { desc = " s.ve up" } },
    { "<C-Down>", "<cmd> :m+<CR>", { desc = " s.ve down" } },
  },

  c = {
    { "<C-k>", "<C-p>", { desc = "nav prev " } },
    { "<C-j>", "<C-n>", { desc = "nav next " } },
  },
}

vim.keymap.set("v", "<C-j>", ":m '>+1<CR> gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR> gv=gv")

s.harpoon = {
  n = {
    { "<leader>ma", "<cmd> :lua require('harpoon'):list():replace_at(4) <CR>", { desc = "replace harpoon 4" } },
    { "<leader>ms", "<cmd> :lua require('harpoon'):list():replace_at(3) <CR>", { desc = "replace harpoon 3" } },
    { "<leader>md", "<cmd> :lua require('harpoon'):list():replace_at(2) <CR>", { desc = "replace harpoon 2" } },
    { "<leader>mf", "<cmd> :lua require('harpoon'):list():replace_at(1) <CR>", { desc = "replace harpoon 1" } },

    { "<A-f>", "<cmd> lua require('harpoon'):list():select(1) <CR>", { desc = "Harpoon switch 1" } },
    { "<A-d>", "<cmd> lua require('harpoon'):list():select(2) <CR>", { desc = "Harpoon switch 2" } },
    { "<A-s>", "<cmd> lua require('harpoon'):list():select(3) <CR>", { desc = "Harpoon switch 3" } },
    { "<A-a>", "<cmd> lua require('harpoon'):list():select(4) <CR>", { desc = "Harpoon switch 4" } },

    { "<leader>aa", "<cmd> lua require('harpoon'):list():add() <CR>", { desc = "add harpoon" } },
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
    { "<leader>ar", "<cmd> lua require('runpoon.mark').add_file() <CR>", { desc = "add runpoon" } },
    -- { "<C-S-e>", "<cmd> lua require('runpoon.ui').toggle_quick_menu() <CR>", { desc = "runpoon ui" } },

    { "<A-m>", "<cmd> lua require('runpoon.ui').run_file(1) <CR>", { desc = "runpoon run file 1" } },
    { "<A-,>", "<cmd> lua require('runpoon.ui').run_file(2) <CR>", { desc = "runpoon run file 2" } },
    { "<A-.>", "<cmd> lua require('runpoon.ui').run_file(3) <CR>", { desc = "runpoon run file 3" } },
    { "<A-/>", "<cmd> lua require('runpoon.ui').run_file(4) <CR>", { desc = "runpoon run file 4" } },
  },
}

-- GENERAL --
map({ "n", "v" }, "<Leader>cb", "<Cmd>CBccbox<CR>")
map({ "n", "v" }, "<Leader>ct", "<Cmd>CBllline<CR>")
map("n", "<Leader>cl", "<Cmd>CBline<CR>")
map({ "n", "v" }, "<Leader>cm", "<Cmd>CBllbox14<CR>")
map({ "n", "v" }, "<Leader>cd", "<Cmd>CBd<CR>")

map({ "i", "n" }, "<F9>", "<C-w><", { desc = "Decrease width" })
map({ "i", "n" }, "<F10>", "<C-w>>", { desc = "Increase width" })
map({ "i", "n" }, "<F11>", "<C-w>+", { desc = "Increase height" })
map({ "i", "n" }, "<F12>", "<C-w>-", { desc = "Decrease height" })
-- END --
s.general = {
  i = {
    { "<A-r>", "<cmd> tabnew<CR>", { desc = "New tab" } },
    { "<C-h>", "<Backspace>", { desc = "Backspace" } },

    { "<A-f>", "<cmd> :lua require('harpoon.ui').nav_file(1) <CR>", { desc = "Harpoon switch 1" } },
    { "<A-d>", "<cmd> :lua require('harpoon.ui').nav_file(2) <CR>", { desc = "Harpoon switch 2" } },
    { "<A-s>", "<cmd> :lua require('harpoon.ui').nav_file(3) <CR>", { desc = "Harpoon switch 3" } },
    { "<A-a>", "<cmd> :lua require('harpoon.ui').nav_file(4) <CR>", { desc = "Harpoon switch 4" } },
    { "<C-s>", "<cmd> w <CR>", { desc = "Save file" } },

    -- {"<C-g>", "<cmd> :Copilot suggestion accept <CR>", { desc = "Acccept Copilot suggestion" } },
  },

  n = {
    { "<C-h>", "<C-w>h", { desc = "Window left" } },
    { "<C-l>", "<C-w>l", { desc = "Window right" } },
    { "<C-j>", "<C-w>j", { desc = "Window down" } },
    { "<C-k>", "<C-w>k", { desc = "Window up" } },

    { "<A-x>", "<C-w>c", { desc = "Window close" } },

    { "<A-e>", "<cmd> qa<CR>", { desc = "Exit" } },

    { "<A-r>", "<cmd> tabnew<CR>", { desc = "New tab" } },

    {
      "<right>",
      function()
        require("nvchad.tabufline").next()
      end,
      { desc = "Goto next buffer" },
    },
    {
      "<left>",
      function()
        require("nvchad.tabufline").prev()
      end,
      { desc = "Goto prev buffer" },
    },

    { "<leader>uu", "<cmd> Lazy update<CR>", { desc = "Lazy upadate" } },

    { "<leader>mm", "<cmd>lua require('treesj').toggle()<CR>", { desc = "toogle array" } },

    -- fd '^*.sh$' -t f -d 1 .run | fzf
    {
      "<leader>rt",
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
              require("nvchad.term").new {
                pos = "bo sp",
                size = 0.3,
                id = "Cpp executor",
                cmd = "bash " .. filename,
              }
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
      "<cmd> :TransferUpload <CR>",
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

    -- Generate lang docs
    { "<leader>rd", "<cmd> :lua require('neogen').generate()<CR>", { desc = "Generate lang docs" } },

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

    { "<leader>fu", "<cmd> Telescope undo <CR> ", { desc = "Find in undo tree" } },
    { "<leader>j", "<cmd> :normal! zz <CR>", { desc = "Center buffer on cursor" } },
    { "<leader>;", "A;<esc>" },
    { "<leader>,", "A,<esc>" },
    {
      "<leader>p",
      '"1p',
      { desc = "paste what you overrode with paste" },
    },
    { "<leader>ct", "<cmd> lua require('chatgpt') <CR><cmd> ChatGPT <CR>", { desc = "Open ChatGPT prompts" } },

    { "<leader>l", "zf", { desc = "fold" } },
    { "<leader>k", "za", { desc = "toggle fold" } },
    { "<tab>", "<C-i>", { desc = "not last position" } },
    {
      "<leader>ra",
      function()
        require("nvchad.renamer").open()
      end,
      { desc = "LSP rename" },
    },
    {
      "<leader>ca",
      function()
        require("tiny-code-action").code_action()
      end,
      { desc = "LSP code action" },
    },
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
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      { desc = "Toggle comment" },
    },
  },
}

s.git = {
  n = {
    { "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "  Git commits" } },
    { "<leader>gb", "<cmd>Telescope git_branches<CR>", { desc = "  Git branches" } },
    { "<leader>gs", "<cmd>AdvancedGitSearch<CR>", { desc = "  Advanced Search" } },
    { "<leader>gg", "<cmd>LazyGit<CR>", { desc = "  LazyGit" } },
    {
      "<leader>gl",
      function()
        package.loaded.gitsigns.blame_line()
      end,
      { desc = "  Blame line" },
    },
  },
}

s.telescope = {
  n = {
    -- find
    { "<leader>fk", "<cmd>Telescope keymaps<CR>", { desc = " Find keymaps" } },
    { "<leader>.", "<cmd> Telescope find_files <CR>", { desc = "Find files" } },
    { "<leader>fa", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", { desc = "Find all" } },
    {
      "<leader>fd",
      "<cmd> Telescope find_files follow=true no_ignore=true hidden=true cwd=~/dotfiles_telescope/ depth=1<CR>",
      { desc = "Find dotfiles" },
    },
    { "<leader>o", "<cmd> FzfLua files cwd=~ <CR>", { desc = "Find all" } },
    { "<leader>fw", "<cmd> Telescope live_grep <CR>", { desc = "Live grep" } },
    { "<leader>b", "<cmd> Telescope buffers <CR>", { desc = "Find buffers" } },
    { "<leader>fh", "<cmd> Telescope help_tags <CR>", { desc = "Help page" } },
    { "<leader>fo", "<cmd> Telescope oldfiles <CR>", { desc = "Find oldfiles" } },
    { "<leader>/", "<cmd> Telescope current_buffer_fuzzy_find <CR>", { desc = "Find in current buffer" } },

    { "cd", "<cmd> Telescope file_browser <CR>", { desc = "file browser in cwd" } },

    { "<leader>fp", "<cmd> Telescope projects <CR>", { desc = "Find projects" } },

    -- git
    { "<leader>cm", "<cmd> Telescope git_commits <CR>", { desc = "Git commits" } },
    { "<leader>gt", "<cmd> Telescope git_status <CR>", { desc = "Git status" } },

    -- pick a hidden term
    { "<leader>pt", "<cmd> Telescope terms <CR>", { desc = "Pick hidden term" } },

    -- theme switcher
    { "<leader>th", "<cmd> Telescope themes <CR>", { desc = "Nvchad themes" } },

    { "<leader>ma", "<cmd> Telescope marks <CR>", { desc = "telescope bookmarks" } },
    { "<leader>fn", "<cmd> Telescope notify <CR>", { desc = "Find Notifications" } },
  },
}

s.session = {
  n = {
    {
      "<leader>sl",
      function()
        require("nvim-possession").list()
      end,
      { desc = " List session" },
    },
    {
      "<leader>sn",
      function()
        require("nvim-possession").new()
      end,
      { desc = " New session" },
    },
    {
      "<leader>su",
      function()
        require("nvim-possession").update()
      end,
      { desc = " Update session" },
    },
    {
      "<leader>sd",
      function()
        require("nvim-possession").delete()
      end,
      { desc = " Delete session" },
    },
  },
}

s.diagnostics = {
  n = {
    { "<leader>t", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" } },
    { "<leader>tb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" } },
    { "<leader>td", "<cmd>TodoTrouble keywords=TODO,FIX,FIXs.,BUG,TEST,NOTE<cr>", { desc = " Todo/Fix/Fixme" } },
  },
}

s.todo = {
  n = {
    { "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = " Todo/Fix/Fixme" } },
  },
}

s.refactoring = {
  x = {
    { "<leader>re", "<cmd> :Refactor extract <CR>", { desc = "" } },
    { "<leader>rf", "<cmd> :Refactor extract_to_file <CR>", { desc = "" } },
    { "<leader>rv", "<cmd> :Refactor extract_var <CR>", { desc = "" } },
  },
  -- n = {
  -- {"<leader>ri", "<cmd> :Refactor inline_var <CR>", { desc = "" } },
  -- {"<leader>rI", "<cmd> :Refactor inline_func <CR>", { desc = "" } },
  -- {"<leader>rb", "<cmd> :Refactor extract_block <CR>", { desc = "" } },
  -- {"<leader>rbf", "<cmd> :Refactor extract_block_to_file <CR>", { desc = "" } },
  -- },
}

s.octo = {
  n = {
    { "<leader>gpl", "<cmd> :Octo pr list <CR><CR>", { desc = "🐙 Octo - List all pull requests" } },
    { "<leader>gpc", "<cmd> :Octo pr create <CR>", { desc = "🐙 Octo - Create a pull request" } },
    { "<leader>vv", "<cmd> :Octo review <CR>", { desc = "🐙 Octo - Start or resume a review" } },
  },
}

s.muren = {
  n = {
    { "<leader>re", "<cmd> :s.renToggle<CR>", { desc = "Toggle muren UI" } },
  },
}

s.spectre = {
  n = {
    {
      "<leader>S",
      "<cmd>lua require('spectre').toggle()<CR>",
      { desc = "Toggle Spectre" },
    },
    -- {"<leader>ss", "<cmd>lua require('spectre').open_visual({=true})<CR>", { desc = "Search current selection" } },
    {
      "<leader>sw",
      "<cmd>lua require('spectre').open_visual({select_word=true})<CR>",
      { desc = "Search current word" },
    },
    {
      "<leader>sp",
      "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>",
      { desc = "Search on current file" },
    },
  },
  v = {
    { "<leader>sw", "<esc><cmd>lua require('spectre').open_visual()<CR>", { desc = "Search current word" } },
  },
}

s.dadbod = {
  n = {
    { "<leader>db", "<cmd> :DBUIToggle<CR>", { desc = "Toggle Dadbod UI" } },
  },
}

s.executor = {
  n = {
    { "<leader>rr", "<cmd> :lua require('executor').executor()<CR>", { desc = "Run code of current buffer" } },
    -- {"<leader>rc", "<cmd> :lua require('executor').term_closer()<CR>", { desc = "Close all terminal windows" } },
  },
}

s.dap = {
  n = {
    { "<leader>dd", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Toggle breakpoint" } },
    { "<leader>dc", "<cmd>lua require'dapui'.close()<CR>", { desc = "close dapui" } },
    { "<leader>dm", "<cmd>DapContinue<CR>", { desc = "DAP continue" } },
    { "<down>", "<cmd>DapStepInto<CR>", { desc = "DAP stepInto" } },
    { "<leader>dk", "<cmd>DapStepOut<CR>", { desc = "DAP Step Out" } },
    { "<up>", "<cmd>DapStepOver<CR>", { desc = "DAP Step Over" } },

    { "<leader>da", "<cmd>lua require('dapui').elements.watches.add()<CR>", { desc = "DAP watcher add" } },
    { "<leader>dr", "<cmd>lua require('dapui').elements.watches.remove()<CR>", { desc = "DAP watcher remove" } },
    { "<leader>de", "<cmd>lua require('dapui').elements.watches.edit()<CR>", { desc = "DAP watcher edit" } },
  },
}

s.colorutils = {
  n = {
    { "<leader>cp", "<cmd> Colortils <CR>", { desc = "Color picker" } },
    { "<leader>cl", "<cmd> Colortils lighten <CR>", { desc = "Color lighten" } },
    { "<leader>cd", "<cmd> Colortils darken <CR>", { desc = "Color darken" } },
  },
}

for _, section in pairs(s) do
  for modes, mappings in pairs(section) do
    for _, mapping in pairs(mappings) do
      map(modes, mapping[1], mapping[2], mapping[3])
    end
  end
end
