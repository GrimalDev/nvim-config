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
  provider = "claude",
  mode = "legacy",
  claude = {
    endpoint = "https://api.anthropic.com",
    -- model = "claude-3-5-sonnet-latest",
    model = "claude-3-5-haiku-latest",
    max_tokens = 8192,
    thinking = {
      type = "disabled",
    },
    disable_tools = true,
  },
  vendors = {
    deepseek = {
      __inherited_from = "openai",
      api_key_name = "DEEPSEEK_API_KEY",
      endpoint = "https://api.deepseek.com",
      model = "deepseek-reasoner",
      disable_tools = true,
    },
    ["claude_37_thinking"] = {
      __inherited_from = "claude",
      model = "claude-3-7-sonnet-latest",
      display_name = "Claude 3.7 (Sonnet) with tools",
      thinking = {
        type = "enabled",
        budget_tokens = 2048,
      },
      disable_tools = true,
      temperature = 1,
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
    ["deepseek_coder_v2_lite_instruct_Q5_K_S"] = {
      __inherited_from = "ollama",
      display_name = "DeepSeek Coder V2 Lite Instruct GGUF:Q5_K_S",
      model = "hf.co/bartowski/DeepSeek-Coder-V2-Lite-Instruct-GGUF:Q5_K_S",
      disable_tools = true,
    },
    ["deepseek_coder_v2_lite_instruct_IQ4_XS"] = {
      __inherited_from = "ollama",
      display_name = "DeepSeek Coder V2 Lite Instruct GGUF:IQ4_XS",
      model = "hf.co/bartowski/DeepSeek-Coder-V2-Lite-Instruct-GGUF:IQ4_XS",
      disable_tools = true,
      max_tokens = 512,
      options = {
        num_ctx = 0,
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
