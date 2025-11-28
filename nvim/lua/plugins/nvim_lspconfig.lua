-- definition, references, and hover keybinds
local function onAttach(client, bufnr)
  local bufOpts = {
	noremap = true,
	silent  = true,
	buffer  = bufnr,
  }

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufOpts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufOpts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufOpts)

  print("LSP started: " .. client.name .. "")
end

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(
	vim.lsp.handlers.hover,
	{
	  border = "rounded",  -- other options: "single", "double", "shadow", or a custom table
	}
  ),
}

local nvimLspConfigTable = {
  "neovim/nvim-lspconfig",
  dependencies = {
	{
	  "folke/lazydev.nvim",
	  ft = "lua", -- only load on lua files
	  opts = {
		library = {
		  -- See the configuration section for more details
		  -- Load luvit types when the `vim.uv` word is found
		  { path = "${3rd}/luv/library", words = { "vim%.uv" } },
		},
	  },
	},
  },
  config = function()
	local lspconf = require("lspconfig")

	local servers = {
	  lspconf.lua_ls,
	  lspconf.pyright,
	  lspconf.gopls,
	  -- lspconf.pylsp,
	  -- lspconf.kotlin_language_server,
	}

	for _, server in ipairs(servers) do
	  server.setup({
		on_attach = onAttach,
		handlers = handlers,
	  })
	end
  end
}

-- return nvimLspConfigTable
return {}
