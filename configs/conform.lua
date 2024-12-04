return {
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
    go = { "gofmt" },
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
