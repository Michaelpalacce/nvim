vim.api.nvim_create_autocmd('BufReadPost', {
	desc = 'Open file at the last position it was edited earlier',
	pattern = '*',
	command = 'silent! normal! g`"zv'
})

vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight yanked text',
	group = vim.api.nvim_create_augroup('highlight_yank', { clear = true }),
	callback = function()
		vim.hl.on_yank({ timeout = 50 })
	end
})

-- Enable autoread
vim.opt.autoread = true

-- Automatically check for file changes on certain events
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
	pattern = "*",
	command = "checktime",
})

-- Notify when a file has been changed externally and reloaded
vim.api.nvim_create_autocmd("FileChangedShellPost", {
	pattern = "*",
	callback = function()
		vim.api.nvim_echo({ { "File changed on disk. Buffer reloaded.", "WarningMsg" } }, false, {})
	end,
})
