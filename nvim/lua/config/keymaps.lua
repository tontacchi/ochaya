-- ====================================
-- Useful Function Pointers & Variables
-- ====================================
local map  = vim.keymap.set
local opts = { noremap = true, silent = true }

local Ex   = function(text) return "<cmd>" .. text .. "<cr>" end
local lead = function(text) return "<space>" .. text end

local nv = {"n", "v"}

-- =========================
-- Quality-of-life / General
-- =========================

map("n", "<esc>",  Ex "nohlsearch")
map("n", lead "w", Ex "write")
map("n", lead "W", Ex "wall")
map("n", lead "q", Ex "x")
map("n", lead "Q", Ex "qa")
map("n", lead "x", Ex "quit")
map("n", lead "c", Ex "close")
map("n", lead "h", Ex "help")
map("n", lead "e", Ex "edit %:p:h")
map("n", lead "H", Ex "enew")

map("n", "Y", "y$")
map("n", "U", "<c-r>")
map(nv, "H", "^")
map(nv, "L", "$")


-- =========================
-- Better movement / editing
-- =========================

map("n", "<c-d>", "<c-d>zz")
map("n", "<c-u>", "<c-u>zz")
map("n", "*", "*zzzv")
map("n", "#", "#zzzv")

map("v", ">", ">gv")
map("v", "<", "<gv")
map("v", "J", ":m '>+1<cr>gv=gv")
map("v", "K", ":m '<-2<cr>gv=gv")

map(nv, lead "p", '"0p')
map(nv, lead "d", '"_d')

map("n", lead "k", Ex "lnext" .. "zz")
map("n", lead "j", Ex "lprev" .. "zz")





-- netrw (does not work with oil.nvim by default)
vim.keymap.set("n", "<leader>pv", "<cmd>Ex<cr>")

-- source under cursor / highlight
vim.keymap.set("n", "<space><space>x", "<cmd>source %<cr>")  -- source & run entire file
-- vim.keymap.set("n", "<space>x", ":.lua<cr>")                 -- run current line
-- vim.keymap.set("v", "<space>x", ":lua<cr>")                  -- run highlighted lines

-- toggle folds
vim.keymap.set("n", ",", "za")

-- <F1> is a misclicked <esc>(:h is still available)
vim.keymap.set("n", "<F1>", "<esc>")
vim.keymap.set("v", "<F1>", "<esc>")
vim.keymap.set("i", "<F1>", "<esc>")
vim.keymap.set("c", "<F1>", "<esc>")
vim.keymap.set("i", "<F13>", "<esc>")

-- new tab
-- vim.keymap.set("n", "<space>te", "<cmd>tabedit<cr>")
-- vim.keymap.set("n", "<tab>", "<cmd>tabnext<cr>")
-- vim.keymap.set("n", "<s-tab>", "<cmd>tabprev<cr>")

-- duplicate current window w/ split
vim.keymap.set("n", "<space>ss", "<cmd>split<cr>")
vim.keymap.set("n", "<space>sv", "<cmd>vsplit<cr>")

-- terminal to right, <esc> exits terminal mode
vim.keymap.set("t", "<esc>", "<C-\\><C-N>")
vim.keymap.set("n", "<space>te", function()
	vim.cmd.vnew()
	vim.cmd.te()
	vim.cmd.wincmd("L")
end)

-- floating terminal (plugin.floaterminal -> nvim/lua/plugin/floaterminal.lua)
vim.keymap.set("n", "<space>ty", require("plugin.floaterminal").toggle, { desc = "Toggle Floating Terminal" })

-- small terminal at bottom of screen
vim.keymap.set("n", "<leader>ts", function()
	vim.cmd.new()
	vim.cmd.te()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 5)
end)


-- yank -> system clipboard
vim.keymap.set("v", "<space>y", "\"+y")  -- 1) highlighted
vim.keymap.set("n", "<space>y", "\"+Y")  -- 2) current line
vim.keymap.set("n", "<space>Y", "\"+y")  -- 3) starts motion. lines jumped are yanked

-- don't yank to register
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("v", "x", '"_x')

-- bring up line under cursor, separated by space. cursor stays in place
vim.keymap.set("n", "J", "mzJ`z")

-- first paste over highlight does not overwrite yanked text
vim.keymap.set("x", "<space>p", "\"_dP")

-- substitute / replace all instances of word under cursor
vim.keymap.set("n", "<space>ra", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- TODO: fix to somehow grab the word under the cursor
vim.keymap.set("v", "<space>ra",  [[:s/\<\>//gI<Left><Left><Left><Left><Left><Left>]])

-- next and previous command completion handled in line with vim motions
vim.keymap.set("c", "<c-j>", "<c-n>")
vim.keymap.set("c", "<c-k>", "<c-p>")

-- omnicomplete, menu navigation
vim.keymap.set("i", "<c-space>", "<c-x><c-o>")
vim.keymap.set("i", "<c-j>", "<c-n>")
vim.keymap.set("i", "<c-k>", "<c-p>")

-- restart language server
vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<cr>")

-- toggle diagnostic text
local showDiagnostic = true
vim.keymap.set("n", "<leader>lv", function()
	showDiagnostic = not showDiagnostic
	vim.diagnostic.config({
		virtual_text = showDiagnostic,
		underline    = showDiagnostic,
		signs        = showDiagnostic,
	})

	if not showDiagnostic then
		print("hidden LSP diagnostics")
	else
		print("showing LSP diagonsitcs")
	end
end)

-- captialize guard for file saving
vim.api.nvim_create_user_command("W", "w", { nargs = 0 })
vim.api.nvim_create_user_command("Wq", "wq", { nargs = 0 })
vim.api.nvim_create_user_command("WQ", "wq", { nargs = 0 })
vim.api.nvim_create_user_command("Q", "q", { nargs = 0 })

-- e.g. in your on_attach callback or a general LSP keymap file
vim.keymap.set("n", "gd", function()
	vim.lsp.buf.definition()
end, { desc = "Go to definition", silent = true })
