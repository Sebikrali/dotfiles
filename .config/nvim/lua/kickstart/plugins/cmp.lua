-- Keybinds
--
-- On the completion popup window
-- <C-n> - Select the [n]ext item
-- <C-p> - Select the [p]revious item 
-- <M-b> - Scroll the documentation window [b]ack
-- <M-f> - Scroll the documentation window [f]orward
-- <C-f> - [A]ccept the completion (mode: insert)
-- <C-S-f>  - [A]ccept the completion (mode: replace)
-- <C-Space> - Manually trigger a completion from nvim-cmp.
-- <C-l> - move to the next expansion/insert location
-- <C-h> - move to the last expansion/insert location
return {
	{ -- Autocompletion
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			-- Snippet Engine & its associated nvim-cmp source
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					-- Build Step is needed for regex support in snippets.
					-- This step is not supported in many windows environments.
					-- Remove the below condition to re-enable on windows.
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {
					-- `friendly-snippets` contains a variety of premade snippets.
					--    See the README about individual language/framework/plugin snippets:
					--    https://github.com/rafamadriz/friendly-snippets
					-- {
					--   'rafamadriz/friendly-snippets',
					--   config = function()
					--     require('luasnip.loaders.from_vscode').lazy_load()
					--   end,
					-- },
				},
			},
			"saadparwaiz1/cmp_luasnip",

			-- Adds other completion capabilities.
			--  nvim-cmp does not ship with all sources by default. They are split
			--  into multiple repos for maintenance purposes.
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-calc",
		},
		config = function()
			-- See `:help cmp`
			local cmp = require("cmp")
      local compare = require("cmp.config.compare")
			local luasnip = require("luasnip")
			luasnip.config.setup({})

      -- Add custom snippets
      luasnip.add_snippets("cpp", require("snippets.cpp"))
      luasnip.add_snippets("c", require("snippets.c"))

      local ELLIPSIS_CHAR = '…'
      local MAX_LABEL_WIDTH = 25
      local MAX_KIND_WIDTH = 14

			local kind_icons = {
				Text = "",
				Method = "󰊕", -- "󰆧"
				Function = "󰊕",
				Constructor = "",
				Field = "󰇽",
				Variable = "󰂡",
				Class = "󰠱",
				Interface = "",
				Module = "",
				Property = "󰜢",
				Unit = "",
				Value = "󰎠",
				Enum = "",
				Keyword = "󰌋",
				Snippet = "",
				Color = "󰏘",
				File = "󰈙",
				Reference = "",
				Folder = "", -- 󰉋
				EnumMember = "",
				Constant = "󰏿",
				Struct = "",
				Event = "",
				Operator = "󰆕",
				TypeParameter = "󰅲",
			}

			-- Customization for Pmenu
			vim.api.nvim_set_hl(0, "PmenuSel", { fg = "#000000", bg = "#F38BA8" })
			vim.api.nvim_set_hl(0, "Pmenu", { fg = "#C5CDD9", bg = "#1E1E2E" })
			vim.api.nvim_set_hl(0, "CmpBorder", { fg = "#CBA6F7", bg = "NONE" })

			-- vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#7E8294", bg = "NONE", strikethrough = true })
			vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#A6E3A1", bg = "NONE", bold = true })
			vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#A6E3A1", bg = "NONE" })
			vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#CBA6F7", bg = "NONE", italic = true })

			cmp.setup({
				view = {
					entries = { name = "custom", selection_order = "near_cursor" },
				},
				window = {
					completion = {
						side_padding = 1,
						-- winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,Search:None",
						scrollbar = false,
						border = {
							{ "╭", "CmpBorder" },
							{ "─", "CmpBorder" },
							{ "╮", "CmpBorder" },
							{ "│", "CmpBorder" },
							{ "╯", "CmpBorder" },
							{ "─", "CmpBorder" },
							{ "╰", "CmpBorder" },
							{ "│", "CmpBorder" },
						},
					},
					documentation = {
						border = {
							{ "╭", "CmpBorder" },
							{ "─", "CmpBorder" },
							{ "╮", "CmpBorder" },
							{ "│", "CmpBorder" },
							{ "╯", "CmpBorder" },
							{ "─", "CmpBorder" },
							{ "╰", "CmpBorder" },
							{ "│", "CmpBorder" },
						},
						-- winhighlight = "Normal:CmpDoc",
					},
				},
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(entry, vim_item)
						-- Kind icons
						vim_item.kind = string.format("%s (%s)", kind_icons[vim_item.kind], string.lower(vim_item.kind)) -- This concatenates the icons with the name of the item kind
						-- Source
						vim_item.menu = ({
							buffer = "[Buf]",
							nvim_lsp = "[LSP]",
							luasnip = "[LuaSnip]",
							nvim_lua = "[Lua]",
							-- latex_symbols = "[LaTeX]",
						})[entry.source.name]
            local content = vim_item.abbr

            -- local fixed_width = 20

            -- Set the fixed completion window width.
            if fixed_width then
              vim.o.pumwidth = fixed_width
            end

            -- Get the width of the current window.
            local win_width = vim.api.nvim_win_get_width(0)

            -- Set the max content width based on either: 'fixed_width'
            -- or a percentage of the window width, in this case 20%.
            -- We subtract 10 from 'fixed_width' to leave room for 'kind' fields.
            local max_content_width = fixed_width and fixed_width - 10 or math.floor(win_width * 0.5)

            -- Truncate the completion entry text if it's longer than the
            -- max content width. We subtract 3 from the max content width
            -- to account for the "..." that will be appended to it.
            if #content > max_content_width then
              vim_item.abbr = vim.fn.strcharpart(content, 0, max_content_width - 3) .. "..."
            else
              vim_item.abbr = content .. (" "):rep(max_content_width - #content)
            end

            return vim_item
          end,
				},
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = { completeopt = "menu,menuone,noinsert" },

				-- For an understanding of why these mappings were
				-- chosen, you will need to read `:help ins-completion`
				--
				-- No, but seriously. Please read `:help ins-completion`, it is really good!
				mapping = cmp.mapping.preset.insert({
					-- Select the [n]ext item
					["<C-n>"] = cmp.mapping.select_next_item(),
					-- Select the [p]revious item
					["<C-p>"] = cmp.mapping.select_prev_item(),

					-- Scroll the documentation window [b]ack / [f]orward
					["<M-b>"] = cmp.mapping.scroll_docs(-4),
					["<M-f>"] = cmp.mapping.scroll_docs(4),

					-- [A]ccept the completion.
					["<C-f>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }),
					["<C-S-f>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),

					-- Manually trigger a completion from nvim-cmp.
					--  Generally you don't need this, because nvim-cmp will display
					--  completions whenever it has completion options available.
					["<C-Space>"] = cmp.mapping.complete({}),

					-- <c-l> will move you to the right of each of the expansion locations (think gopls placeholder)
					-- <c-h> is similar, except moving you backwards.
					["<C-l>"] = cmp.mapping(function()
						if luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						end
					end, { "i", "s" }),
					["<C-h>"] = cmp.mapping(function()
						if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						end
					end, { "i", "s" }),

					-- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
					--    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
				}),
        sorting = {
          priority_weight = 1.0,
          comparators = {
            -- compare.score_offset, -- not good at all
            compare.locality,
            compare.recently_used,
            compare.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
            compare.offset,
            compare.order,
            -- compare.scopes, -- what?
            -- compare.sort_text,
            -- compare.exact,
            -- compare.kind,
            -- compare.length, -- useless 
          },
        },
				sources = {
					{ name = "nvim_lsp", priority = 8 },
					{ name = "luasnip", priority = 9 },
					{ name = "path" },
          { name = 'calc' },
				},
			})
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
