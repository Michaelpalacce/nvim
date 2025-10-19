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
					adapter = "ollama",
				}
			},
			adapters = {
				http = {
					ollama = function()
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
