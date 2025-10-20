return {
	{
		"j-hui/fidget.nvim", -- shows a spinner of lsp loading
		event = "LspAttach",
		opts = {
			window = {
				avoid = { "aerial", "NvimTree", "neotest-summary" }
			}
		},
	},
}
