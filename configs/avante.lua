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
  provider = "claude_37",
  mode = "legacy",
  providers = {
    ["claude_37_thinking"] = {
      __inherited_from = "claude",
      model = "claude-3-7-sonnet-latest",
      display_name = "Claude 3.7 (Sonnet) with tools",
      pro = {
        thinking = {
          type = "enabled",
          budget_tokens = 2048,
        },
        temperature = 1,
      },
      disable_tools = true,
    },
    ["claude_37"] = {
      __inherited_from = "claude",
      model = "claude-3-7-sonnet-latest",
      display_name = "Claude 3.7 (Sonnet)",
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
