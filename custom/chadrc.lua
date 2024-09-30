---@type ChadrcConfig
local M = {}

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

vim.api.nvim_create_autocmd("FileType", {
  pattern = "dbout",
  callback = function()
    vim.cmd [[ setlocal nofoldenable ]]
  end,
})

-- vim.api.nvim_create_autocmd({ "BufAdd", "BufEnter", "tabnew" }, {
--   callback = function()
--     vim.t.bufs = vim.tbl_filter(function(bufnr)
--       -- return vim.api.nvim_buf_get_option(bufnr, "modified")
--       -- return if git commit
--       return vim.api.nvim_buf_get_name(bufnr):find ".git/COMMIT_EDITMSG" == nil
--     end, vim.t.bufs)
--   end,
-- })

M.ui = {
  theme = "everforest",
  theme_toggle = { "everforest", "everforest" },
  -- tabufline = { enabled = false },

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

  -- transparency = true,

  nvdash = {
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
      { "󰊳 Update", "Spc u u", "Lazy update" },
      { "󰈞  Find Project", "Spc f p", "Telescope project" },
      { "  File Browser", "c d    ", "Telescope file_browser" },
      { "󰈭  Global Search", "Spc f w", "Telescope live_grep" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󰔫 Diagnostics", "Spc t  ", "TroubleToggle" },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
  },
}

M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

return M
