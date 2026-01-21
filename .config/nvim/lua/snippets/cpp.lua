local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
	-- For each
	s("fore", {
		t({ "for (const auto& " }),
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
	-- Classic For for iterating over vector/array
	s("forit", {
		t({ "for (size_t i = 0; i < " }),
		i(1, ""),
		t({ ".size(); i++) {", "\t" }),
		i(2, ""),
		t({ "", "}" }),
	}),

	-- Doc comment
	s("doc", {
		t({ "/**", " * @brief " }),
		i(1, ""),
		t({ ".", " * @param " }),
		i(2, ""),
		t({ ".", " * @param " }),
		i(3, ""),
		t({ ".", " * @return " }),
		i(4, ""),
		t({ ".", " */" }),
	}),

	-- Function
	s("func", {
		i(1, "return"),
		t({ " " }),
		i(2, "name"),
		t({ "(" }),
		i(3, "params"),
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

	-- Class
	s("cla", {
		t({ "class " }),
		i(1, ""),
		t({ " {", "\t" }),
		i(2, ""),
		t({ "", "};" }),
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

	-- formatted log
	s("fmt", {
		t({ "std::cout << std::format(\""}),
		i(1, ""),
		t({ "\\n\", "}),
		i(2, ""),
		t({ ");" })
	}),

	s("cout", {
		t({ "std::cout << \"" }),
		i(1, ""),
		t({ "\\n\";" })
	}),

	s("newline", {
		t({ "std::cout << \"\\n" }),
		i(1, ""),
		t({ "\";" })
	}),

	s("ndb", {
		t({ "#ifndef NDEBUG", "" }),
		i(1, ""),
		t({ "", "#endif" })
	}),


	-- Vulkan specific stuff
	s("stype", {
		t({ ".sType = VK_STRUCTURE_TYPE_" }),
		i(1, ""),
		t({ "," })
	}),


}

