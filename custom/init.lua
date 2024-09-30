-- vim.opt.colorcolumn = "80"

-- tab size
-- vim.opt.tabstop = 4
-- vim.opt.shiftwidth = 4

-- relative lining
vim.opt.relativenumber = true
-- vim.opt.jumpoptions = "stack"
-- run :Router on init

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

-- vim.api.nvim_create_autocmd({ "TextChanged" }, {
--   pattern = { "?*" },
--   command = "update",
--   desc = "Auto-save on text change",
-- })
