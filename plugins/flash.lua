return {
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"S",
				mode = { "n" },
				function()
					require("flash").jump({
						jump = {
							autojump = true,
							history = true,
						},
						label = {
							exclude = "hjkliardco",
							current = false,
						},
						search = {
							max_length = 2,
							forward = false,
							wrap = false,
						},
						modes = {
							search = { enable = false },
						},
					})
				end,
				desc = "Flash",
			},
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump({
						jump = {
							autojump = true,
							history = true,
						},
						label = {
							exclude = "hjkliardco",
							current = false,
							rainbow = { enable = true, shade = 9 },
						},
						search = {
							max_length = 2,
							forward = true,
							wrap = false,
						},
						modes = {
							search = { enable = false },
						},
					})
				end,
				desc = "Flash",
			},
			{
				"z",
				mode = { "n", "o", "x" },
				function()
					require("flash").treesitter({ labels = "dfshjkl;gwertyuiopzxcvbnm" })
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					-- jump to a remote location to execute the operator
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"<C-f>",
				mode = { "n", "o", "x" },
				function()
					-- show labeled treesitter nodes around the search matches
					require("flash").treesitter_search({
						remote_op = {
							restore = true,
							motion = true,
						},
					})
				end,
				desc = "Treesitter Search",
			},
		},
	}
