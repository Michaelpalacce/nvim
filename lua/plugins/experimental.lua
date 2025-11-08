return {
	{
		"OXY2DEV/markview.nvim",
		lazy = false,
		dependencies = { "saghen/blink.cmp" },
		keys = {
			{ "<leader>m", function() vim.cmd.Markview() end, mode = "n", desc = "Toggle [M]arkview", },
		},
	},
	{
		"folke/persistence.nvim",
		event = "VeryLazy",
		opts = {
			dir = vim.fn.stdpath("state") .. "/sessions/",
			need = 1,
			branch = true,
		},
		keys = {
			{ "<leader>ql", function() require("persistence").load() end,                mode = "n", desc = "Persistence: [L]oad" },
			-- select a session to load
			{ "<leader>qs", function() require("persistence").select() end,              mode = "n", desc = "Persistence: [S]elect" },
			-- load the last session
			{ "<leader>qL", function() require("persistence").load({ last = true }) end, mode = "n", desc = "Persistence: [L]oad Last" },
			-- stop Persistence => session won't be saved on exit
			{ "<leader>qq", function() require("persistence").stop() end,                mode = "n", desc = "Persistence: [Q]uit" },
		}
	}
}
