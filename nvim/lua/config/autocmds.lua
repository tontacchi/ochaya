-- removes line numbers in opened terminals
vim.api.nvim_create_autocmd("TermOpen", {
	desc  = "Removes line numbers in opened terminals",
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
		-- vim.opt.scrolloff = 0
	end
})

-- highlights yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc  = "Highlights when yanking / copying text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end
})

-- disables CSS comment * continuation
vim.api.nvim_create_autocmd("FileType", {
	pattern = "css",
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- disables markdown `ex:` firing
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt_local.modeline = false
	end,
	group = vim.api.nvim_create_augroup("MarkdownNoModeline", { clear = true }),
})

-- disable LSP semantic highlights (text colors)
-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	callback = function(args)
-- 		local client = vim.lsp.get_client_by_id(args.data.client_id)
-- 		if client then
-- 			client.server_capabilities.semanticTokensProvider = nil
-- 		end
-- 	end,
-- })

-- syncs markview preview w/ current buffer open
local cache_last_file = ""

local function notify_markview(file)
	local socket = vim.loop.new_pipe(false)
	-- print("notify: socket created")

	socket:connect( "/tmp/markdown.sock", function(err)
		-- print("notify: markdown.sock connection fired")

		if err then
			-- print("notify: error - closing socket")
			-- print(err)
			-- socket.close()
			return
		end

		-- print("notify: writing file path to markdown.sock")
		socket:write(file .. "\n", function()
			-- print("notify: wrote file path")
			socket:shutdown(function()
				-- print("notify: shutdown socket")
				socket:close()
				-- print("notify: closed socket")
			end)
		end)
	end);
end

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		-- print("bufenter: fired")
		local file = vim.fs.normalize(vim.fn.expand("%:p"))

		if vim.bo.filetype ~= "markdown" then
			-- print("bufenter: not markdown")
			return
		end

		local vault = vim.fs.normalize("~/vaults/Vault/")
		if not vim.startswith(file, vault) then
			-- print("bufenter: not in the vault")
			return
		end
		-- print("bufenter: in the vault")

		-- skip sending if buffer does not change within the same file
		if file == cache_last_file then
			return
		end

		cache_last_file = file
		notify_markview(file)
	end,
})

