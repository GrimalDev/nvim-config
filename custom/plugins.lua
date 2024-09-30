local overrides = require "custom.configs.overrides"

local plugins = {
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = { "python" },
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "phpactor",
        "black",
        "pyright",
        "ruff",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
  },
  {
    "nvim-tree/nvim-web-devicons",
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
  },
  {
    "ThePrimeagen/harpoon",
    lazy = false,
    opts = overrides.harpoon,
  },
  {
    "gennaro-tedesco/nvim-possession",
    lazy = false,
    dependencies = {
      "ibhagwan/fzf-lua",
    },
    config = function()
      local sessionsPath = os.getenv "NVIM_SESSIONS"
      require("nvim-possession").setup {
        autoload = true,
        autoswitch = {
          enable = true, -- default false
        },
        sessions = {
          sessions_icon = "",
          sessions_path = sessionsPath,
        },
      }
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  {
    "wellle/targets.vim",
    lazy = false,
  },
  {
    "sindrets/diffview.nvim",
    lazy = false,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    lazy = false,
  },

  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    dependencies = {
      "nvim-telescope/telescope-file-browser.nvim",
      "debugloop/telescope-undo.nvim",
      "lpoto/telescope-docker.nvim",
    },
    opts = overrides.telescope,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,
  },
  -- {
  --   "ratataque/project.nvim",
  --   config = function()
  --     require("project_nvim").setup {
  --       -- your configuration comes here
  --       -- or leave it empty to use the default settings
  --       -- refer to the configuration section below
  --       show_hidden = true,
  --       ignore_gitignore = true,
  --     }
  --   end,
  -- },

  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  {
    "Wansmer/treesj",
    -- keys = { '<space>m' },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup { --[[ your config ]]
      }
    end,
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    opts = {},
  },
  {
    "notjedi/nvim-rooter.lua",
    lazy = false,
    config = function()
      require("nvim-rooter").setup {
        rooter_patterns = { ".git" },
        trigger_patterns = { "*" },
        manual = false,
        fallback_to_parent = false,
      }
    end,
  },
  {
    "rcarriga/nvim-notify",
    lazy = false,
    config = function()
      vim.notify = require "notify"
      require("notify").setup {
        background_colour = "#000000",
      }
    end,
  },
  {
    "shawnyu5/executor.nvim",
    config = function()
      -- overide a language execution if any environement id set with with the prefix RUN_
      local injectedConfig = overrides.executor
      for lang, _ in pairs(injectedConfig.commands) do
        if os.getenv("RUN_" .. lang:upper()) then
          injectedConfig.commands[lang][1] = os.getenv("RUN_" .. lang:upper())
        end
      end
      require("executor").setup(injectedConfig)
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "S",
        mode = { "n" },
        function()
          require("flash").jump {
            jump = {
              autojump = true,
              history = true,
            },
            label = {
              exclude = "hjkliardco",
              current = false,
            },
            search = {
              max_length = 2,
              forward = false,
              wrap = false,
            },
            modes = {
              search = { enable = false },
            },
          }
        end,
        desc = "Flash",
      },
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump {
            jump = {
              autojump = true,
              history = true,
            },
            label = {
              exclude = "hjkliardco",
              current = false,
              rainbow = { enable = true, shade = 9 },
            },
            search = {
              max_length = 2,
              forward = true,
              wrap = false,
            },
            modes = {
              search = { enable = false },
            },
          }
        end,
        desc = "Flash",
      },
      {
        "z",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter { labels = "dfshjkl;gwertyuiopzxcvbnm" }
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          -- jump to a remote location to execute the operator
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "<C-f>",
        mode = { "n", "o", "x" },
        function()
          -- show labeled treesitter nodes around the search matches
          require("flash").treesitter_search {
            remote_op = {
              restore = true,
              motion = true,
            },
          }
        end,
        desc = "Treesitter Search",
      },
    },
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup()
    end,
  },
  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
  },
  {
    "nvim-pack/nvim-spectre",
    lazy = false,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require "conform"

      conform.setup {
        formatters_by_ft = {
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          svelte = { "prettier" },
          css = { "prettier" },
          scss = { "prettier" },
          html = { "prettier" },
          json = { "prettier" },
          yaml = { "prettier" },
          markdown = { "prettier" },
          graphql = { "prettier" },
          lua = { "stylua" },
          python = { "black" },
          blade = { "tlint" },
          php = { "pretty-php" },
          bash = { "shellcheck", "shfmt" },
          dart = { "dart_format" },
          cpp = { "clang_format" },
          ["_"] = { "trim_whitespace" },
        },
        format_on_save = {
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        },
        formatters = {
          ["pretty-php"] = {
            prepend_args = { "--tab=2" },
          },
          ["dartfmt"] = {
            command = "dart",
            args = "format -o show $FILENAME | ghead -n -1",
          },
        },
      }
    end,
  },
  {
    "danymat/neogen",
    config = true,
    lazy = false,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
  },
  {
    "debugloop/telescope-undo.nvim",
    dependencies = { -- note how they're inverted to above example
      {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
      },
    },
    config = function(_, opts)
      -- Calling telescope's setup from multiple specs does not hurt, it will happily merge the
      -- configs for us. We won't use data, as everything is in it's own namespace (telescope
      -- defaults, as well as each extension).
      require("telescope").setup(opts)
      require("telescope").load_extension "undo"
    end,
  },
  {
    "GrimalDev/runpoon.nvim",
    event = "VeryLazy",
    config = function()
      require "runpoon"
    end,
  },
  {
    "akinsho/flutter-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    lazy = false,
    opts = overrides.flutter_tools,
  },
  -- {
  --   "m4xshen/hardtime.nvim",
  --   dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  --   event = "VeryLazy",
  --   config = function()
  --     require("hardtime").setup(overrides.hardtime)
  --     vim.cmd "Hardtime enable"
  --   end,
  -- },
  {
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
  },
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
  },
  {
    "aaronhallaert/advanced-git-search.nvim",
    cmd = { "AdvancedGitSearch" },
    config = function()
      -- optional: setup telescope before loading the extension
      require("telescope").setup {
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
      }

      require("telescope").load_extension "advanced_git_search"
    end,
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        hover = { enabled = false }, -- <-- HERE!
        signature = { enabled = false }, -- <-- HERE!
      },
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        long_message_to_split = true, -- long messages will be sent to a split
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },
  {
    "chrisgrieser/nvim-spider",
    lazy = true,
    keys = {
      { "e", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" } },
      { "w", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" } },
      { "b", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" } },
    },
    opts = {},
  },
  {
    "chrisgrieser/nvim-various-textobjs",
    lazy = false,
    opts = {
      useDefaultKeymaps = true,
      disabledKeymaps = { "an", "in", "aN", "iN", "n" },
    },
  },
  {
    "LunarVim/bigfile.nvim",
    lazy = false,
    config = function()
      -- default config
      require("bigfile").setup {
        filesize = 1, -- size of the file in MiB, the plugin round file sizes to the closest MiB
        pattern = { "*" }, -- autocmd pattern or function see <### Overriding the detection of big files>
        features = { -- features to disable
          "indent_blankline",
          "illuminate",
          "lsp",
          "treesitter",
          "syntax",
          "matchparen",
          "vimopts",
          "filetype",
        },
      }
    end,
  },
  {
    "onsails/lspkind.nvim",
    lazy = false,
    init = function()
      require("lspkind").init {
        mode = "symbol_text",
        preset = "default",
        symbol_map = {
          Text = "󰉿",
          Method = "󰆧",
          Function = "󰊕",
          Constructor = "",
          Field = "󰜢",
          Variable = "󰀫",
          Class = "󰠱",
          Interface = "",
          Module = "",
          Property = "󰜢",
          Unit = "󰑭",
          Value = "󰎠",
          Enum = "",
          Keyword = "󰌋",
          Snippet = "",
          Color = "󰏘",
          File = "󰈙",
          Reference = "󰈇",
          Folder = "󰉋",
          EnumMember = "",
          Constant = "󰏿",
          Struct = "󰙅",
          Event = "",
          Operator = "󰆕",
          TypeParameter = "",
        },
      }
    end,
  },
  -- {
  --   "sainnhe/everforest",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     -- Optionally configure and load the colorscheme
  --     -- directly inside the plugin declaration.
  --     vim.g.everforest_enable_italic = true
  --     vim.g.background = "dark"
  --     vim.g.everforest_background = "hard"
  --     vim.g.everforest_better_performance = 1
  --     vim.cmd.colorscheme "everforest"
  --   end,
  -- },
}

return plugins
