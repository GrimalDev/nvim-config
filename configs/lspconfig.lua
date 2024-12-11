-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

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

lspconfig.intelephense.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "php" },
  root_dir = function()
    return vim.loop.cwd()
  end,
}

lspconfig.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html", "php" },
  root_dir = function()
    return vim.loop.cwd()
  end,
}

lspconfig.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "css" },
  root_dir = function()
    return vim.loop.cwd()
  end,
}

lspconfig.ts_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "javascript", "typescript", "typescriptreact" },
  root_dir = function()
    return vim.loop.cwd()
  end,
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "go" },
  root_dir = function()
    return vim.loop.cwd()
  end,
}

lspconfig.marksman.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetype = { "markdown" },
  root_dir = function()
    return vim.loop.cwd()
  end,
}

lspconfig.lemminx.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetype = { "xml" },
  root_dir = function()
    return vim.loop.cwd()
  end,
}

lspconfig.htmx.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html", "php" },
  root_dir = function()
    return vim.loop.cwd()
  end,
}

lspconfig.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html" },
  root_dir = function()
    return vim.loop.cwd()
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
    return vim.loop.cwd()
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
    return vim.loop.cwd()
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
