return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			{
				"rcarriga/nvim-notify",
				opts = {
					background_colour = "NotifyBackground",
					timeout = 2500,
					fps = 144,
					render = "wrapped-default", -- https://github.com/rcarriga/nvim-notify?tab=readme-ov-file#render-style
					stages = "static",
					max_height = 50,
					max_width = 100,
				}
			},
		},
		opts = {
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
				hover = { silent = true },

				progress = {
					enabled = false,
				},
			},
			views = {
				notify = {
					replace = true,
				},
			},
			routes = {
				{
					filter = {
						event = "msg_show",
						find = "%d+L, %d+B",
					},
					opts = { skip = true },
				},
				{
					filter = {
						error = true,
						find = "E553", -- Reaching end of quicklist
					},
					opts = { skip = true },
				},
				{
					filter = {
						error = true,
						find = "E42", -- Error no errors
					},
					opts = { skip = true },
				},
				{
					filter = {
						warning = true,
						find = "position_encoding param is required in", -- IDK
					},
					opts = { skip = true },
				},
				{
					filter = {
						error = true,
						find = "Mark has invalid line number", -- When opening Neovim and trying to go back
					},
					opts = { skip = true },
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = true, -- add a border to hover docs and signature help
			},
		},
	},
}
