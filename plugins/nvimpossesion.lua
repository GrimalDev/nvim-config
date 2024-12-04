  return {
		"gennaro-tedesco/nvim-possession",
		lazy = false,
		dependencies = {
			"ibhagwan/fzf-lua",
		},
		config = function()
			local sessionsPath = os.getenv("NVIM_SESSIONS")
			require("nvim-possession").setup({
				autoload = true,
				autoswitch = {
					enable = true, -- default false
				},
				sessions = {
					sessions_icon = "",
					sessions_path = sessionsPath,
				},
			})
		end,
	}
