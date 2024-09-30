local config = require "plugins.configs.lspconfig"

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require "lspconfig"

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
