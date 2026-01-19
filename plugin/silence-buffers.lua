-- This should ideally set buffers created in the background or entered that have no name as `nofile` and not listed.
-- This way I can do :wa and not be annoyed by an error
-- this messes up the file if you save it with `:w name`, you'll have to close the buffer and re-open it but we live with it
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "BufAdd" }, {
	pattern = "*",
	callback = function(args)
		local bufnr = args.buf

		if not vim.api.nvim_buf_is_valid(bufnr) then return end

		local name = vim.api.nvim_buf_get_name(bufnr)
		local buftype = vim.bo[bufnr].buftype

		if name == "" and buftype == "" then
			vim.bo[bufnr].buftype = "nofile"
			vim.bo[bufnr].buflisted = false
		end
	end,
})
