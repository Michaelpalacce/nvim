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
			{ "<leader>qs", function() require("persistence").load() end,                mode = "n", },
			-- select a session to load
			{ "<leader>qS", function() require("persistence").select() end,              mode = "n" },
			-- load the last session
			{ "<leader>ql", function() require("persistence").load({ last = true }) end, mode = "n" },
			-- stop Persistence => session won't be saved on exit
			{ "<leader>qd", function() require("persistence").stop() end,                mode = "n" },
		}
	}
}
