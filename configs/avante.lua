return {
  mappings = {
    ask = "<leader>at",
    clear = "<leader>ac",
    edit = "<leader>ie",
    refresh = "<leader>ir",
  },
  behaviour = {
    support_paste_from_clipboard = true,
  },
  hints = {
    enabled = false,
  },
  -- provider = "deepseek",
  provider = "claude_45",
  mode = "legacy",
  providers = {
    ["copilot-gpt41"] = {
      __inherited_from = "copilot",
      model = "gpt-4.1",
      display_name = "Copilot custom (GPT-4.1)",
      disable_tools = true,
      pro = {
        thinking = {
          type = "disabled",
        },
      },
    },
    ["copilot-claude4"] = {
      __inherited_from = "copilot",
      model = "claude-sonnet-4",
      display_name = "Copilot custom (Claude Sonnet 4)",
      disable_tools = true,
      pro = {
        thinking = {
          type = "disabled",
        },
      },
    },
    ["copilot-claude4-thinking"] = {
      __inherited_from = "copilot",
      model = "claude-sonnet-4",
      display_name = "Copilot custom (Claude Sonnet 4 thinking)",
      disable_tools = true,
      pro = {
        thinking = {
          type = "enabled",
        },
      },
    },
    ["claude_45_thinking"] = {
      __inherited_from = "claude",
      model = "claude-sonnet-4-5-20250929",
      display_name = "Claude 4.5 (Sonnet) with thinking",
      pro = {
        thinking = {
          type = "enabled",
          budget_tokens = 2048,
        },
        temperature = 1,
      },
      disable_tools = true,
    },
    ["claude_45"] = {
      __inherited_from = "claude",
      model = "claude-sonnet-4-5-20250929",
      display_name = "Claude 4.5 (Sonnet)",
      thinking = {
        type = "disabled",
      },
      disable_tools = true,
    },
    ["claude_haiku_tools"] = {
      __inherited_from = "claude",
      model = "claude-3-5-haiku-latest",
      display_name = "Claude 3.5 (Haiku) with tools",
      disable_tools = false,
    },
    ["claude_haiku"] = {
      __inherited_from = "claude",
      model = "claude-3-5-haiku-latest",
      display_name = "Claude 3.5 (Haiku)",
      disable_tools = true,
    },
    ["copilot-custom"] = {
      __inherited_from = "copilot",
      model = "claude-3.7-sonnet",
      display_name = "Copilot (Claude Sonnet 3.7)",
      disable_tools = false,
      pro = {
        thinking = {
          type = "disabled",
        },
      },
    },
  },
  file_selector = {
    provider_opts = {
      get_filepaths = function(params)
        local pwd = vim.fn.getcwd()
        local cmd = string.format("fd --base-directory '%s' --hidden", vim.fn.fnameescape(pwd))
        return vim.fn.systemlist(cmd)
      end,
    },
  },
}
