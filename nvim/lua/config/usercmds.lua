vim.api.nvim_create_user_command("LspInfo",
	function()
		vim.cmd("checkhealth vim.lsp")
	end,
	{ desc = "Shows built-in LSP health info" }
)
