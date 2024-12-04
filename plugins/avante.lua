
	return {
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		version = false, -- set this if you want to always pull the latest change
		opts = {
      mappings = {
        ask = "<leader>ia",
        edit = "<leader>ie",
        refresh = "<leader>ir",
      },
      behaviour = {
        support_paste_from_clipboard = true,
      },
      hints = {
        enabled = false,
      },
    },
		build = "make",
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			"zbirenbaum/copilot.lua", -- for providers='copilot'
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				-- Make sure to set this up properly if you have lazy=true
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
		keys = function(_, keys)
			local opts = require("lazy.core.plugin").values(
				require("lazy.core.config").spec.plugins["avante.nvim"],
				"opts",
				false
			)

			local mappings = {
				{
					opts.mappings.ask,
					function()
						require("avante.api").ask()
					end,
					desc = "avante AI: ask",
					mode = { "n", "v" },
				},
				{
					opts.mappings.refresh,
					function()
						require("avante.api").refresh()
					end,
					desc = "avante AI: refresh",
					mode = "v",
				},
				{
					opts.mappings.edit,
					function()
						require("avante.api").edit()
					end,
					desc = "avante AI: edit",
					mode = { "n", "v" },
				},
			}
			mappings = vim.tbl_filter(function(m)
				return m[1] and #m[1] > 0
			end, mappings)
			return vim.list_extend(mappings, keys)
		end,
	}
