-- removes line numbers in opened terminals
vim.api.nvim_create_autocmd("TermOpen", {
	desc  = "Removes line numbers in opened terminals",
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
		-- vim.opt.scrolloff = 0
	end
})

-- highlights yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc  = "Highlights when yanking / copying text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end
})

