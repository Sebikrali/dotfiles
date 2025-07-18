local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
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

	-- Typedef Struct
	s("typ", {
		t({ "typedef struct {", "\t" }),
		i(1, ""),
		t({ "", "} " }),
		i(2, ""),
		t({ ";" }),
	}),

	-- include System
	s("inc", {
		t({ "#include <" }),
		i(1, ""),
		t({ ">" }),
	}),
	-- include Local
	s("incl", {
		t({ "#include \"" }),
		i(1, ""),
		t({ "\"" }),
	}),

}

