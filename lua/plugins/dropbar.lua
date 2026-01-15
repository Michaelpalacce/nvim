return {
	{
		'Bekaboo/dropbar.nvim',
		opts = {
			bar = {
				-- Display only the file path
				sources = function(buf, _)
					local sources = require('dropbar.sources')
					if vim.bo[buf].ft == 'markdown' then
						return {
							sources.path,
						}
					end
					if vim.bo[buf].buftype == 'terminal' then
						return {
							sources.terminal,
						}
					end
					return {
						sources.path,
					}
				end,
			},
		},
	},
}
