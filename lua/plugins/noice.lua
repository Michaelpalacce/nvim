return {
	{
		"rcarriga/nvim-notify",
		opts = {
			background_colour = "#000000",
			timeout = 2500,
			fps = 144,
			render = "default", -- https://github.com/rcarriga/nvim-notify?tab=readme-ov-file#render-style
			stages = "fade"
		}
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
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
					enabled = true,
					format = "lsp_progress",
					format_done = "lsp_progress_done",
					-- throttle = 1000 / 30,
					view = "notify",
				},
			},
			views = {
				notify = {
					replace = true
				},
			},
			routes = {
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
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		}
	},
}
