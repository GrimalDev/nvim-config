-- TODO: Delete this line, this is a test

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
    enabled = true,
    lazyload = true,
    order = { "treeOffset", "buffers", "tabs", "btns" },
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
    overriden_modules = function(modules)
      modules[6] = (function()
        -- local st_modules = require "nvchad_ui.statusline.vscode_colored"
        -- Load info for harpoon
        local function get_marked()
          local Marked = require "harpoon.mark"
          local filename = vim.api.nvim_buf_get_name(0)
          local success, index = pcall(Marked.get_index_of, filename)
          if success and index and index ~= nil then
            return "󱡀 " .. index .. " "
          else
            return ""
          end
        end
        -- Load info for possession
        local function get_session()
          -- local session = require("nvim-possession").status()
          local session = require("nvim-possession").status()
          if session ~= nil then
            return "󰐃 "
          else
            return "󰐄 "
          end
        end

        return "%#HarpoonHl#" .. get_marked() .. "%#SessionHl#" .. get_session() .. " "
      end)()
    end,
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
vim.api.nvim_create_autocmd("FileType", {
  pattern = "dbout",
  callback = function()
    vim.opt_local.foldenable = false
  end,
})

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

return M
