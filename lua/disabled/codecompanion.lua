return {
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			opts = {
				log_level = "DEBUG", -- or "TRACE"
			},

			strategies = {
				chat = {
					adapter = "openai_compatible",
				}
			},
			adapters = {
				http = {
					openai_compatible = function()
						return require("codecompanion.adapters").extend("openai_compatible", {
							env = {
								url = "http://10.1.236.134:1234",
							},
						})
					end,
				}
			},
		},
	},
}
