vim.api.nvim_create_user_command("LspInfo",
	function()
		vim.cmd("checkhealth vim.lsp")
	end,
	{ desc = "Shows built-in LSP health info" }
)

-- replace -> w/ →
local function replace_arrow()
	if vim.bo.filetype ~= "markdown" then return end
	vim.cmd([[%s/->/→/g]])
	vim.cmd("norm A")
end
vim.api.nvim_create_user_command("ReplaceArrow", replace_arrow, {})
vim.keymap.set("n", "<leader>.", "<cmd>ReplaceArrow<cr>")
