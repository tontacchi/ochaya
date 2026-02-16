-- =============================================================================
-- Function Pointers, Variables, Tables
-- =============================================================================
local map  = vim.keymap.set
local opts = { noremap = true, silent = true }

local Ex   = function(text) return "<cmd>"      .. text .. "<cr>" end
local Norm = function(text) return "<cmd>norm " .. text .. "<cr>" end
local lead = function(text) return "<space>" .. text end

local nv = {"n", "v"}

-- =============================================================================
-- Quality-of-life / General
-- =============================================================================

map("n", "<esc>",  Ex "nohlsearch")
map("n", lead "w", Ex "write")
map("n", lead "W", Ex "wall")
map("n", lead "q", Ex "wq")
map("n", lead "Q", Ex "qa")
map("n", lead "x", Ex "q!")
map("n", lead "h", Ex "help")
map("n", lead "e", Ex "edit %:p:h")
map("n", lead "H", Ex "enew")

map("n", "Y", "y$")
map("n", "U", "<c-r>")
map(nv, "H", "^")
map(nv, "L", "$")


-- =============================================================================
-- Better movement / editing
-- =============================================================================

map("n", "<c-d>", "<c-d>zz")
map("n", "<c-u>", "<c-u>zz")
map("n", "*", "*zzzv")
map("n", "#", "#zzzv")

map("v", ">", ">gv")
map("v", "<", "<gv")
map("v", "J", ":m '>+1<cr>gv=gv")
map("v", "K", ":m '<-2<cr>gv=gv")

map("n", lead "k", Ex "lnext" .. "zz")
map("n", lead "j", Ex "lprev" .. "zz")

map("i", "<c-BS>", "<c-w>", opts)
map("i", "<c-h>", "<c-w>", opts)

map("n", lead "\\", Norm "gcc")
map("v", lead "\\", "gc", { remap = true })


-- =============================================================================
-- LSP (built-in) + Diagnostics
-- =============================================================================
map("n", lead "do", vim.diagnostic.open_float, opts)


-- netrw (does not work with oil.nvim by default)
map("n", lead "pv", Ex "Ex")

-- source under cursor / highlight
map("n", lead(lead "x"), function() Ex "source %" print("sourced file") end)  -- source & run entire file
-- vim.keymap.set("n", "<space>x", ":.lua<cr>")                 -- run current line
-- vim.keymap.set("v", "<space>x", ":lua<cr>")                  -- run highlighted lines

-- toggle folds
map("n", ",", "za")

-- <F1> is a misclicked <esc>(:h is still available)
map("n", "<F1>", "<esc>")
map("v", "<F1>", "<esc>")
map("i", "<F1>", "<esc>")
map("i", "<F13>", "<esc>")
map("c", "<F1>", "<esc>")

-- new tab
-- vim.keymap.set("n", "<space>te", "<cmd>tabedit<cr>")
-- vim.keymap.set("n", "<tab>", "<cmd>tabnext<cr>")
-- vim.keymap.set("n", "<s-tab>", "<cmd>tabprev<cr>")

-- duplicate current window w/ split
map("n", lead "ss", Ex "split")
map("n", lead "sv", Ex "vsplit")

-- terminal to right, <esc> exits terminal mode
map("t", "<esc>", "<C-\\><C-N>")
map("n", lead "te", function()
	vim.cmd.vnew()
	vim.cmd.te()
	vim.cmd.wincmd("L")
end)

-- floating terminal (plugin.floaterminal -> nvim/lua/plugin/floaterminal.lua)
map("n", lead "ty", require("plugin.floaterminal").toggle)

-- small terminal at bottom of screen
map("n", lead "ts", function()
	vim.cmd.new()
	vim.cmd.te()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 5)
end)


-- yank -> system clipboard
map("n", lead "y", "\"+Y")
map("v", lead "y", "\"+y")
map("n", lead "Y", "\"+y")  -- motion. finish with {num}{direction}

-- vim.keymap.set("v", "<space>y", "\"+y")  -- 1) highlighted
-- vim.keymap.set("n", "<space>y", "\"+Y")  -- 2) current line
-- vim.keymap.set("n", "<space>Y", "\"+y")  -- 3) starts motion. lines jumped are yanked

-- don't yank to register
map(nv, "x", '"_x')

-- bring up line under cursor, separated by space. cursor stays in place
vim.keymap.set("n", "J", "mzJ`z")

-- first paste over highlight does not overwrite yanked text
map("x", lead "p", "\"_dP")

-- substitute / replace all instances of word under cursor
map("n", lead "ra", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

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
map("n", lead "lr", Ex "LspRestart")

-- toggle diagnostic text
local showDiagnostic = true
map("n", lead "lv", function()
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

-- e.g. in your on_attach callback or a general LSP keymap file
map("n", "gd", function()
	vim.lsp.buf.definition()
end, { desc = "Go to definition", silent = true })
