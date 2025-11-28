local autopairsTable = {
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = function()
			local npairs = require("nvim-autopairs")
			local Rule   = require("nvim-autopairs.rule")

			npairs.setup({ })

			npairs.add_rules({
				-- matches /* → /**/, cursor set to /*|*/
				Rule("/*", "/**/")
					:with_pair(function() return true end)
					:with_move(function() return true end)
					:set_end_pair_length(2)
			})
		end,
	}
}

return autopairsTable
