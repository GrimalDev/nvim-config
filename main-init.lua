-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
---/!\ This file is intended to sit a the root of your nvim config /!\
---Ye shall be warned
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

function HighlightedFoldtext()
  local pos = vim.v.foldstart
  local line = vim.api.nvim_buf_get_lines(0, pos - 1, pos, false)[1]
  local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
  local parser = vim.treesitter.get_parser(0, lang)
  local query = vim.treesitter.query.get(parser:lang(), "highlights")

  if query == nil then
    return vim.fn.foldtext()
  end

  local tree = parser:parse({ pos - 1, pos })[1]
  local result = {}

  local line_pos = 0

  local prev_range = nil

  for id, node, _ in query:iter_captures(tree:root(), 0, pos - 1, pos) do
    local name = query.captures[id]
    local start_row, start_col, end_row, end_col = node:range()
    if start_row == pos - 1 and end_row == pos - 1 then
      local range = { start_col, end_col }
      if start_col > line_pos then
        table.insert(result, { line:sub(line_pos + 1, start_col), "Folded" })
      end
      line_pos = end_col
      local text = vim.treesitter.get_node_text(node, 0)
      if prev_range ~= nil and range[1] == prev_range[1] and range[2] == prev_range[2] then
        result[#result] = { text, "@" .. name }
      else
        table.insert(result, { text, "@" .. name })
      end
      prev_range = range
    end
  end

  return result
end

local bg = vim.api.nvim_get_hl(0, { name = "StatusLine" }).bg
local hl = vim.api.nvim_get_hl(0, { name = "Folded" })
hl.bg = bg

local folded_hl = vim.api.nvim_get_hl(0, { name = "Folded" })
vim.api.nvim_set_hl(0, "Folded", {
  fg = folded_hl.fg,
  bg = bg,
  bold = folded_hl.bold,
  italic = folded_hl.italic,
  underline = folded_hl.underline,
  undercurl = folded_hl.undercurl,
  sp = folded_hl.sp,
})
vim.opt.foldtext = [[luaeval('HighlightedFoldtext')()]]

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevelstart = 99 -- Start with all folds open

-- Define specific overrides
local fold_overrides = {
  lua = { method = "expr", expr = "nvim_treesitter#foldexpr()", level = 99 },
  -- typescript = { method = "expr", expr = "v:lua.vim.treesitter.foldexpr()", level = 0 },
  -- elixir = { method = "expr", expr = "nvim_treesitter#foldexpr()", level = 1 },
  -- python = { method = "indent", level = 2 },
}

-- Define blacklisted buffers where folding should be disabled
local folding_blacklist = {
  "NvimTree",
  "aerial",
  "dashboard",
  "help",
  "terminal",
  "Trouble",
  "TelescopePrompt",
  "mason",
  "lazy",
  "Avante",
  "dbui",
  "dbout",
  "cmp",
}

-- Create a single autocmd that applies the overrides
vim.api.nvim_create_autocmd("FileType", {
  pattern = vim.tbl_keys(fold_overrides),
  callback = function()
    local ft = vim.bo.filetype
    local settings = fold_overrides[ft]

    if settings.method then
      vim.opt_local.foldmethod = settings.method
    end
    if settings.expr then
      vim.opt_local.foldexpr = settings.expr
    end
    if settings.level then
      vim.opt_local.foldlevelstart = settings.level
    end
  end,
})

-- Disable folding for blacklisted buffers
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  callback = function()
    local bufname = vim.fn.bufname()
    local filetype = vim.bo.filetype

    for _, pattern in ipairs(folding_blacklist) do
      if bufname:match(pattern) or filetype == pattern then
        -- Disable folding for this buffer
        vim.opt_local.foldenable = false
        return
      end
    end

    -- Enable folding for non-blacklisted buffers
    vim.opt_local.foldenable = true
    -- Set foldlevel to a high value to show all folds
    vim.opt_local.foldlevel = 99
  end,
})

vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)
