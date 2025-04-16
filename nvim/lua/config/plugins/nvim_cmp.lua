local nvim_cmp_table = {
  "hrsh7th/nvim-cmp",
  dependencies = {
	"L3MON4D3/LuaSnip",
  },
  config = function()
	-- Autopairs integration
	local cmp_autopairs = require("nvim-autopairs.completion.cmp")

	local cmp = require("cmp")
	cmp.setup({
	  preselect = cmp.PreselectMode.None,
	  sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		-- { name = "luasnip" },
	  }),
	  snippet = {
		expand = function(args)
		  vim.snippet.expand(args.body)
		end
	  },
	  mapping = cmp.mapping.preset.insert({})
	})

	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end
}

return nvim_cmp_table
