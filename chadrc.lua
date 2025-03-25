-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "everforest",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
  --
}
M.ui = {
  cmp = {
    lspkind_text = true,
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
    format_colors = {
      tailwind = false,
    },
  },
  telescope = { style = "borderless" }, -- borderless / bordered

  --
  -- lazyload it when there are 1+ buffers
  tabufline = {
    enabled = false,
    lazyload = false,
    modules = nil,
  },
  hl_override = {
    ["Normal"] = { bg = "NONE" },
    ["NormalFloat"] = { bg = "NONE" },
    ["LineNr"] = { fg = "orange" },
    ["CursorLineNr"] = { fg = "vibrant_green" },
    ["IncSearch"] = { fg = "#ffffff", bg = "#ff034f" },
    ["Substitute"] = { fg = "black", bg = "orange" },
    ["Search"] = { fg = "#1e1d2d", bg = "#abe9b3" },
    ["NvimTreeNormal"] = { bg = "NONE" },
    ["Visual"] = { bg = "#214283" },
    ["@comment"] = { fg = "#717276" },
    ["IndentBlanklineContextChar"] = { fg = "#afffcf" },

    -- Diff
    ["DiffChange"] = { fg = "NONE", bg = "NONE" },
    ["DiffModified"] = { fg = "NONE", bg = "NONE" },
    ["DiffText"] = { fg = "NONE", bg = "#2B9128" },
    ["DiffAdd"] = { fg = "NONE", bg = "#2B9128" },
    ["DiffAdded"] = { fg = "NONE", bg = "#2B9128" },
    ["DiffDelete"] = { fg = "NONE", bg = "blue" },
    ["DiffRemoved"] = { fg = "NONE", bg = "#B22126" },
    ["DiffChangeDelete"] = { fg = "NONE", bg = "#B22126" },
  },

  term = {
    winopts = { number = false },
    sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
    float = {
      relative = "editor",
      row = 0.3,
      col = 0.25,
      width = 0.5,
      height = 0.4,
      border = "single",
    },
  },

  statusline = {
    theme = "default",
    separator_style = "default",
    order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "harpoon", "session", "encoding", "lsp", "cwd" },
    modules = {
      harpoon = function()
        local harpoon = require "harpoon"
        local file_path = vim.api.nvim_buf_get_name(0)

        -- Get the current list (default is "default")
        local list = harpoon:list()

        -- Check if the current file is in the harpoon list
        for i, item in ipairs(list.items) do
          if item.value == file_path then
            return "%#HarpoonHl#󱡀 " .. i .. " "
          end
        end

        return ""
      end,

      session = function()
        local session = require("nvim-possession").status()
        if session ~= nil then
          return "%#SessionHl#󰐃 "
        else
          return "%#SessionHl#󰐄 "
        end
      end,

      encoding = function()
        local encoding = vim.bo.fileencoding
        if encoding == "" then
          encoding = vim.o.encoding
        end
        return "%#EncodingHl#󰘦 " .. encoding .. " "
      end,
    },
  },
}

M.nvdash = {
  load_on_startup = true,

  header = {
    [[                     ██████                   ]],
    [[                  ██      ██                  ]],
    [[                  ██      ██                  ]],
    [[                ▒▒▒▒      ██                  ]],
    [[  ██████        ▒▒▒▒        ██      ████████  ]],
    [[██      ████    ██          ██  ████        ██]],
    [[██          ██████          ████            ██]],
    [[  ██            ████      ████            ██  ]],
    [[  ██          ██    ██  ██    ██          ██  ]],
    [[    ██        ██    ██████    ██        ██    ]],
    [[    ██        ██  ██      ██  ██      ██      ]],
    [[      ██      ████          ████    ██        ]],
    [[        ██  ████    ▒▒▒▒▒▒    ██  ██          ]],
    [[          ██  ██    ▒▒▒▒▒▒    ████            ]],
    [[        ██    ██    ▒▒▒▒▒▒    ██  ██          ]],
    [[      ░░░░    ████          ████    ██        ]],
    [[      ░░░░    ██  ██      ██  ██      ██      ]],
    [[    ██        ██    ██  ██    ██        ██    ]],
    [[  ██          ██    ████  ██  ██          ██  ]],
    [[██              ████        ██            ██  ]],
    [[██          ██████          ████▒▒▒▒        ██]],
    [[██      ████    ██          ██  ▒▒▒▒██      ██]],
    [[  ██████        ██          ██        ██████  ]],
    [[                  ██      ██                  ]],
    [[                  ██      ██                  ]],
    [[                  ██      ██                  ]],
    [[                    ██████                    ]],
  },
  buttons = {
    { txt = "󰊳 Update", keys = "Spc u u", cmd = "Lazy update" },
    { txt = "  File Browser", keys = "c d    ", cmd = "Telescope file_browser" },
    { txt = "󰈭  Global Search", keys = "Spc f w", cmd = "Telescope live_grep" },
    { txt = "󰈚  Recent Files", keys = "Spc f o", cmd = "Telescope oldfiles" },
    { txt = "󰔫 Diagnostics", keys = "Spc t  ", cmd = "TroubleToggle" },
    { txt = "  Themes", keys = "Spc t h", cmd = "Telescope themes" },
    { txt = "  Cheatsheets", keys = "Spc c h", cmd = "NvCheatsheet" },
    { txt = "  Search keys", keys = "Spc f k", cmd = " Find keymaps" },
  },
}

vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.o.undofile = true

local g = vim.g

if g.neovide then
  g.neovide_transparency = 0.95
  -- vim.g.neovide_transparency = 0.0
  g.neovide_refresh_rate = 120
  g.neovide_cursor_vfx_mode = "ripple"
  g.neovide_cursor_animation_length = 0.03
  g.neovide_cursor_trail_size = 0.9
  g.neovide_remember_window_size = true
  vim.g.neovide_scale_factor = 0.7
  vim.g.neovide_window_blurred = 1
  vim.o.guifont = "Source Code Pro iCursive S12:h16"
  -- Helper function for transparency formatting
  local alpha = function()
    return string.format("%x", math.floor(255 * (vim.g.transparency or 0.8)))
  end
  -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
  vim.g.neovide_transparency = 0.0
  vim.g.transparency = 0.9
  vim.g.neovide_background_color = "#1E1E2E" .. alpha()
end

vim.api.nvim_create_autocmd({ "BufModifiedSet", "BufReadPost", "BufNewFile", "BufWinEnter" }, {
  pattern = "<buffer>",

  callback = function()
    local buf = vim.api.nvim_get_current_buf()

    -- print(bufnr, cur_buf())
    if vim.bo[buf].modified then
      vim.api.nvim_set_hl(0, "St_file_info", { fg = "#ff034f" })
    else
      vim.api.nvim_set_hl(0, "St_file_info", { fg = "#afffcf" })
    end
  end,
})

-- create highlight groups for statusline
vim.api.nvim_set_hl(0, "HarpoonHl", { fg = "#CF6377", bg = "NONE" })
vim.api.nvim_set_hl(0, "SessionHl", { fg = "#89B35C", bg = "NONE" })
vim.api.nvim_set_hl(0, "EncodingHl", { fg = "#69AED6", bg = "NONE" })

vim.opt.foldtext = [[luaeval('HighlightedFoldtext')()]]

return M
