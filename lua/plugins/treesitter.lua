return {
	{
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		build = ':TSUpdate'
	},
	-- This brings back incremental_selection ... no idea how it works
	{
		"MeanderingProgrammer/treesitter-modules.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		---@module 'treesitter-modules'
		---@type ts.mod.UserConfig
		opts = {
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-e>", -- set to `false` to disable one of the mappings
					node_incremental = "<C-e>",
					node_decremental = "<C-x>",
				},
			},
		},
	},
}
