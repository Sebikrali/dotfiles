local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
	-- Checkbox
	s("check", {
		t({ "- [ ] " }),
		i(1, ""),
	}),

	s("link", {
		t({ "[" }),
		i(1, "display"),
		t({ "](" }),
		i(2, "link"),
		t({ ")" }),
	}),

	s("code", {
		-- t({ "```", "" }),
		t({ "```" }),
		i(2, "language"),
		t({ "", "" }),
		i(1, "code"),
		t({ "", "```" }),
	}),

	s("table", {
		t({ "| " }),
		i(1, "Col1"),
		t({ " | " }),
		i(2, "Col2"),
		t({ " |", "| --------- | ----------- |", "| " }),
		i(3, "Item1"),
		t({ " | " }),
		i(4, "Item2"),
		t({ " |" }),
	}),

}
