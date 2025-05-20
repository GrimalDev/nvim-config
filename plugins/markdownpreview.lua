return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  dependencies = {
    "iamcco/mathjax-support-for-mkdp",
  },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
}
