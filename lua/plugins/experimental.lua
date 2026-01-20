return {
	{
		"NickvanDyke/opencode.nvim",
		dependencies = {
		},
		config = function()
			---@type opencode.Opts
			vim.g.opencode_opts = {
				-- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition" on the type or field.
			}

			-- Required for `opts.events.reload`.
			vim.o.autoread = true

			-- Recommended/example keymaps.
			vim.keymap.set({ "n", "x" }, "<leader>Aa",
				function() require("opencode").ask("@this: ", { submit = true }) end,
				{ desc = "Ask opencode…" })
			vim.keymap.set({ "n", "x" }, "<leader>Ae", function() require("opencode").select() end,
				{ desc = "Execute opencode action…" })
			vim.keymap.set({ "n", "t" }, "<leader>At", function() require("opencode").toggle() end,
				{ desc = "Toggle opencode" })

			-- vim.keymap.set({ "n", "x" }, "go", function() return require("opencode").operator("@this ") end,
			-- 	{ desc = "Add range to opencode", expr = true })
			-- vim.keymap.set("n", "goo", function() return require("opencode").operator("@this ") .. "_" end,
			-- 	{ desc = "Add line to opencode", expr = true })

			-- vim.keymap.set("n", "<S-C-u>", function() require("opencode").command("session.half.page.up") end,
			-- 	{ desc = "Scroll opencode up" })
			-- vim.keymap.set("n", "<S-C-d>", function() require("opencode").command("session.half.page.down") end,
			-- 	{ desc = "Scroll opencode down" })
			--
			-- -- You may want these if you stick with the opinionated "<C-a>" and "<C-x>" above — otherwise consider "<leader>o…".
			-- vim.keymap.set("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true })
			-- vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true })
		end,
	},
	{
		"TheNoeTrevino/haunt.nvim",
		opts = {
			sign = "󱙝",
			sign_hl = "DiagnosticInfo",
			virt_text_hl = "HauntAnnotation",
			annotation_prefix = " 󰆉 ",
			line_hl = nil,
			virt_text_pos = "eol",
			data_dir = nil,
			picker_keys = {
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

			map("n", prefix .. "C", function()
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
				haunt_picker.show()
			end, { desc = "Show Picker" })
		end,
	}
}
