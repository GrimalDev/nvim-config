return {
		"rcarriga/nvim-notify",
		lazy = false,
		config = function()
			vim.notify = require("notify")
			require("notify").setup({
				background_colour = "#000000",
			})
		end,
	}