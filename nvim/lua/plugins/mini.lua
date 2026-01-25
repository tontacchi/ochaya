local function sectionmode()
	local mode = vim.fn.mode()

	-- Decide the mode text mini should display
	local label_map = {
		n  = "力",
		i  = "字",
		v  = "目",
		V  = "一",
		["\22"] = "口",
		c  = "入",
		R  = "上",
		t  = "",
	}

	-- Decide which highlight group mini should use
	local hl_map = {
		n = "MiniStatuslineModeNormal",
		i = "MiniStatuslineModeInsert",
		v = "MiniStatuslineModeVisual",
		V = "MiniStatuslineModeVisual",
		["\22"] = "MiniStatuslineModeVisual",
		R = "MiniStatuslineModeReplace",
		c = "MiniStatuslineModeCommand",
		t = "MiniStatuslineModeOther",
	}

	-- creating both return values
	-- local text = " " .. (label_map[mode] or mode) .. " "
	local text = label_map[mode] or mode
	local hl = hl_map[mode] or "MiniStatuslineModeOther"

	return text, hl
end

local mini_table = {{
	"echasnovski/mini.nvim",
	config = function ()
		local statusline = require("mini.statusline")
		local surround   = require("mini.surround")

		-- status bar at the bottom
		statusline.setup({ use_icons = true })

		-- changes mode text displayed
		statusline.section_mode = sectionmode

		-- surround + setup keybinds
		surround.setup({
			mappings = {
				add = '<leader>sa',            -- Add surrounding in Normal and Visual modes
				delete = '<leader>sd',         -- Delete surrounding
				find = '<leader>sf',           -- Find surrounding (to the right)
				find_left = '<leader>sF',      -- Find surrounding (to the left)
				highlight = '<leader>sh',      -- Highlight surrounding
				replace = '<leader>sr',        -- Replace surrounding
				update_n_lines = '<leader>sn', -- Update `n_lines`

				suffix_last = 'l', -- Suffix to search with "prev" method
				suffix_next = 'n', -- Suffix to search with "next" method
			},
			custom_surroundings = {
				['('] = { output = { left = '(', right = ')' } },
				[')'] = { output = { left = '( ', right = ' )' } },
			}
		})
	end
}}

return mini_table
