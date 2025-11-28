local autopairsTable = {
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = function()
			local init = require("nvim-autopairs")

			init.setup({

			})
		end,
	}
}

return autopairsTable
