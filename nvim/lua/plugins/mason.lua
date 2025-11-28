local function onAttach(client, bufnr)
	local bufOpts = {
		noremap = true,
		silent  = true,
		buffer  = bufnr,
	}

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufOpts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufOpts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufOpts)
end

local mason = {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				automatic_installation = {},
				ensure_installed = {
					'gopls',
					'lua_ls',
					-- 'pyright',
				},
				handlers = {
					function(server_name)
						require('lspconfig')[server_name].setup({
							on_attach = onAttach
						})
					end,
				}
			})
		end
	}
}

return mason
-- return {}
