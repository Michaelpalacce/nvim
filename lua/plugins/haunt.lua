return {
	{
		"TheNoeTrevino/haunt.nvim",
		-- default config: change to your liking, or remove it to use defaults
		---@class HauntConfig
		opts = {
			sign = "󱙝",
			sign_hl = "DiagnosticInfo",
			virt_text_hl = "HauntAnnotation", -- links to DiagnosticVirtualTextHint
			annotation_prefix = " 󰆉 ",
			line_hl = nil,
			virt_text_pos = "eol",
			data_dir = nil,
			picker = "fzf", -- "auto", "snacks", "telescope", or "fzf"
			picker_keys = { -- picker agnostic, we got you covered
				delete = { key = "d", mode = { "n" } },
				edit_annotation = { key = "a", mode = { "n" } },
			},
		},
		-- recommended keymaps, with a helpful prefix alias
		init = function()
			local haunt = require("haunt.api")
			local haunt_picker = require("haunt.picker")
			local map = vim.keymap.set
			local prefix = "<leader>m"

			-- annotations
			map("n", prefix .. "a", function()
				haunt.annotate()
			end, { desc = "Annotate" })

			map("n", prefix .. "t", function()
				haunt.toggle_annotation()
			end, { desc = "Toggle annotation" })

			map("n", prefix .. "T", function()
				haunt.toggle_all_lines()
			end, { desc = "Toggle all annotations" })

			map("n", prefix .. "d", function()
				haunt.delete()
			end, { desc = "Delete bookmark" })

			map("n", prefix .. "D", function()
				haunt.clear_all()
			end, { desc = "Delete all bookmarks" })

			-- move
			map("n", prefix .. "p", function()
				haunt.prev()
			end, { desc = "Previous bookmark" })

			map("n", prefix .. "n", function()
				haunt.next()
			end, { desc = "Next bookmark" })

			-- picker
			map("n", prefix .. "l", function()
				haunt_picker.show({ prompt = "Boo> " })
			end, { desc = "Show Picker" })
		end,
	}
}
