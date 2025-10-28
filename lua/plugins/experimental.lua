return {
	{
		"OXY2DEV/markview.nvim",
		lazy = false,
		dependencies = { "saghen/blink.cmp" },
		keys = {
			{ "<leader>m", function() vim.cmd.Markview() end, mode = "n", desc = "Toggle [M]arkview", },
		},
	},
}
