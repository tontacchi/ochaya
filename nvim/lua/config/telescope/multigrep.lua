local pickers     = require("telescope.pickers")
local finders     = require("telescope.finders")
local make_entry  = require("telescope.make_entry")
local config_vals = require("telescope.config").values
local sorters     = require("telescope.sorters")

local multigrep = {}

local live_multigrep = function(opts)
	opts = opts or {}
	opts.cwd = opts.cwd or vim.uv.cwd()

	local finder = finders.new_async_job({
		command_generator = function(prompt)
			if not prompt or prompt == "" then return nil end

			local pieces = vim.split(prompt, "  ")
			local args   = { "rg" }

			if pieces[1] then
				table.insert(args, "-e")
				table.insert(args, pieces[1])
			end

			if pieces[2] then
				table.insert(args, "-g")
				table.insert(args, pieces[2])
			end

			---@diagnostic disable-next-line: deprecated
			return vim.tbl_flatten({
				args,
				{ "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
			})
		end,
		entry_maker = make_entry.gen_from_vimgrep(opts),
		cwd = opts.cwd,
	})

	pickers.new(opts, {
		debounce     = 100,
		prompt_title = "Multi Grep",
		finder       = finder,
		previewer    = config_vals.grep_previewer(opts),
		sorter       = sorters.empty(),
	}):find()
end

multigrep.setup = function()
	vim.keymap.set("n", "<leader>fg", live_multigrep)
end

return multigrep

