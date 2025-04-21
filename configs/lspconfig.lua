-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local nvlsp = require "nvchad.configs.lspconfig"
local on_attach = nvlsp.on_attach
local capabilities = nvlsp.capabilities

local home = os.getenv "HOME"
if not home then
  error "HOME environment variable is not set"
end
-- Ensure home is treated as a string
home = tostring(home)
if home:sub(-1) ~= "/" then
  home = home .. "/"
end

-- lspconfig.lua_ls.setup {
--   on_attach = on_attach,
--   capabilities = nvlsp.capabilities,
--   filetypes = { "lua" },
--   root_dir = function(fname)
--     return lspconfig.util.root_pattern("lua", ".git")(fname) or vim.fs.dirname(fname)
--   end,
--   settings = {
--     Lua = {
--       workspace = {
--         library = vim.tbl_extend(
--           "keep",
--           -- this will probably vary depending on setup, not sure if plugins like mason even install it.
--           { home .. ".cache/lua-language-server/meta/" },
--           -- and runtime-directories.
--           vim.api.nvim_get_runtime_file("", true)
--         ),
--       },
--       diagnostics = {
--         globals = { "Sbar" },
--       },
--     },
--   },
--   cmd = {
--     "lua-language-server",
--     "--logpath",
--     home .. ".cache/lua-language-server/",
--     "--metapath",
--     home .. ".cache/lua-language-server/meta/",
--   },
-- }
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim", "Sbar" },
      },
    },
  },
}

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "rust" },
  root_dir = lspconfig.util.root_pattern "Cargo.toml",
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
  -- root_dir = function(fname)
  --   return util.root_pattern(".git", "setup.py",  "setup.cfg", "pyproject.toml", "requirements.txt")(fname) or
  --   util.path.dirname(fname)
  -- end
}

local get_intelephense_license = function()
  local f = assert(io.open(os.getenv "HOME" .. "/intelephense/license.txt", "rb"))
  local content = f:read "*a"
  f:close()
  return string.gsub(content, "%s+", "")
end

lspconfig.intelephense.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "php" },
  root_dir = function()
    return vim.fs.dirname(vim.api.nvim_buf_get_name(0))
  end,
  init_options = {
    licenceKey = get_intelephense_license(),
  },
}

lspconfig.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html", "php" },
  root_dir = function()
    return vim.fn.getcwd()
  end,
}

lspconfig.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "css" },
  root_dir = function()
    return vim.fn.getcwd()
  end,
}

-- lspconfig.ts_ls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { "javascript", "typescript", "typescriptreact" },
--   root_dir = function()
--     return vim.loop.cwd()
--   end,
-- }

lspconfig.gopls.setup {
  on_attach = function(client, bufnr)
    -- Default on_attach
    if on_attach then
      on_attach(client, bufnr)
    end

    -- Additional setup for golangci-lint
    require("lspconfig.configs").golangcilsp = {
      default_config = {
        cmd = { "golangci-lint", "run", "--out-format=json" },
        root_dir = lspconfig.util.root_pattern(".git", "go.mod"),
        filetypes = { "go" },
        single_file_support = true,
      },
    }

    -- Attach golangci-lint as an additional linter
    require("lspconfig")["golangcilsp"].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end,
  capabilities = capabilities,
  filetypes = { "go" },
  root_dir = function()
    return vim.fn.getcwd()
  end,
}

lspconfig.marksman.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "markdown" },
  root_dir = function()
    return vim.fs.dirname(vim.api.nvim_buf_get_name(0))
  end,
}

lspconfig.lemminx.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "xml" },
  root_dir = function()
    return vim.fs.dirname(vim.api.nvim_buf_get_name(0))
  end,
}

lspconfig.htmx.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html", "php" },
  root_dir = function()
    return vim.fn.getcwd()
  end,
}

lspconfig.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html" },
  root_dir = function()
    return vim.fn.getcwd()
  end,
}

-- lspconfig.dockerfile.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { "dockerfile" },
--   root_dir = function()
--     return vim.loop.cwd()
--   end;
-- })
--

lspconfig.emmet_language_server.setup {
  filetypes = {
    "eruby",
    "html",
    "javascript",
    "javascriptreact",
    "pug",
    "typescriptreact",
    "php",
    "ejs",
  },
  -- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
  -- **Note:** only the options listed in the table are supported.
  init_options = {
    ---@type table<string, string>
    includeLanguages = {},
    --- @type string[]
    excludeLanguages = {},
    --- @type string[]
    extensionsPath = {},
    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
    preferences = {},
    --- @type boolean Defaults to `true`
    showAbbreviationSuggestions = true,
    --- @type "always" | "never" Defaults to `"always"`
    showExpandedAbbreviation = "always",
    --- @type boolean Defaults to `false`
    showSuggestionsAsSnippets = false,
    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
    syntaxProfiles = {},
    --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
    variables = {},
  },
}

lspconfig.somesass_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "sass", "scss", "less" },
  root_dir = function()
    return vim.fn.getcwd()
  end,
}

-- lspconfig.clangd.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { "c", "cpp", "objc", "objcpp" },
--   root_dir = function()
--     return vim.loop.cwd()
--   end,
-- }

lspconfig.ccls.setup {
  init_options = {
    cache = {
      directory = ".ccls-cache",
    },
  },
}

lspconfig.nextls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = function()
    return vim.fn.getcwd()
  end,
  cmd = { "nextls", "--stdio" },
  init_options = {
    extensions = {
      credo = { enable = true },
    },
    experimental = {
      completions = { enable = true },
    },
  },
}

lspconfig.ts_ls.setup {
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vim.fn.stdpath "data"
          .. "/mason/packages/vue-language-server/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin",
        languages = { "typescript", "javascript", "vue" },
      },
    },
  },
  filetypes = {
    "javascript",
    "typescript",
    "vue",
    "typescriptreact",
    "php",
  },
}

lspconfig.volar.setup {
  init_options = {
    vue = {
      hybridMode = true,
    },
  },
  filetypes = { "vue" },
}

lspconfig.svelte.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = function()
    return vim.fn.getcwd()
  end,
}
