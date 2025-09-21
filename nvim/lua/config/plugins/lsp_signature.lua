local lsp_signature_table = {
  "ray-x/lsp_signature.nvim",
  event = "InsertEnter",                     -- Load when entering insert mode
  opts = {
	bind = true,
	floating_window = true,
	always_trigger = true,
	handler_opts = { border = "rounded" },
  },
  config = function(_, opts)
	require("lsp_signature").setup(opts)  -- Ensure lsp_signature is initialized
  end
}

-- return {}
return lsp_signature_table
