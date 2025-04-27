local luasnipTable = {
  {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.3", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	build = "make install_jsregexp",
	config = function()
	  require("luasnip.loaders.from_lua").lazy_load({
		paths = {
		  "~/.config/nvim/lua/snippets/go.lua",
		  "~/.config/nvim/lua/snippets/python.lua",
		  -- "~/.config/nvim/lua/snippets/lua.lua",
		  -- "~/.config/nvim/lua/snippets/markdown.lua",
		}
	  })

	  -- Keybindings
	  local ls = require("luasnip")

      vim.keymap.set({ "i", "s" }, "<Tab>", function()
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        else
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, true, true), "n", true)
        end
      end, { silent = true })

      vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
        if ls.jumpable(-1) then
          ls.jump(-1)
        else
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<S-Tab>", true, true, true), "n", true)
        end
      end, { silent = true })
	  -- end Keybindings
	end
  },
};

return luasnipTable;
