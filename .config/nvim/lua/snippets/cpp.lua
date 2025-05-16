local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	-- For each
	s("fore", {
		t({ "for (" }),
		i(1, ""), -- NOTE: Maybe add placeholder text
		t({ " : " }),
		i(2, ""),
		t({ ") {", "\t" }),
		i(3, ""),
		t({ "", "}" }),
	}),

	-- Classic For
	s("fori", {
		t({ "for (" }),
		i(1, ""),
		t({ "; " }),
		i(2, ""),
		t({ "; " }),
		i(3, ""),
		t({ ") {", "\t" }),
		i(4, ""),
		t({ "", "}" }),
	}),

	-- Struct
	s("stru", {
		t({ "struct " }),
		i(1, ""),
		t({ " {", "\t" }),
		i(2, ""),
		t({ "", "};" }),
	}),

	-- include System
	s("in", {
		t({ "#include <" }),
		i(1, ""),
		t({ ">" }),
	}),
	-- include Local
	s("inl", {
		t({ "#include \"" }),
		i(1, ""),
		t({ "\"" }),
	}),

}

