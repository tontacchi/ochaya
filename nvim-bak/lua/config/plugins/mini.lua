local mini = {
  {
	"echasnovski/mini.nvim",
	config = function ()
	  local status_line = require("mini.statusline")
	  local surround    = require("mini.surround")
	  local setup_table = { use_icons = true }

	  status_line.setup(setup_table)
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
  }
}

return mini
