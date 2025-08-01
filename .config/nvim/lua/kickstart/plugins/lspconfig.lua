-- Keybinds
--
-- Builtin
-- grn - Buf rename
-- gra - Code actions
-- grr - Buf references
-- gri - Buf implementation
-- gO - Document symbols
-- CTRL-S - Signature help
--
-- gd - Goto definition under cursor
-- gr - Goto references under cursor
-- gI - Goto implementation under cursor
-- gD - Goto declaration under cursor
--
-- <leader>D - Open type definitions in telescope
-- <leader>ds - Open document symbols in telescope
-- <leader>ws - Open workspace symbols in telescope
-- <leader>rn - Rename under cursor
-- <leader>ca - Code Actions
--
-- K - Open hover documentation
-- <C-k> - Open signature help
-- gh - Run :LspClangdSwitchSourceHeader
--
-- :Mason - To open mason
return {
	{ -- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs and related tools to stdpath for Neovim
			{ "williamboman/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			-- Useful status updates for LSP.
			{ "j-hui/fidget.nvim", opts = {} },

			-- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
			-- used for completion, annotations and signatures of Neovim apis
			{ "folke/neodev.nvim", opts = {} },
		},
		config = function()
      -- Enabel virtual_text
      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
          virtual_text = true,
        }
      )

      vim.diagnostic.config({
        virtual_text = {
          prefix = '@ ', -- Could be '●', '▎', 'x', '■', , 
          current_line = true,
        },
        severity_sort = true,
        float = {
          source = "always",  -- Or "if_many"
        },
      })

      --  This function gets run when an LSP attaches to a particular buffer.
      vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					-- In this case, we create a function that lets us more easily define mappings specific
					-- for LSP related items. It sets the mode, buffer and description for us each time.
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					-- Jump to the definition of the word under your cursor.
					--  This is where a variable was first declared, or where a function is defined, etc.
					--  To jump back, press <C-t>.
					map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

					-- Find references for the word under your cursor.
					-- map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
					map("gtr", require("telescope.builtin").lsp_references, "[G]oto [T]elescope [R]eferences")

					-- Jump to the implementation of the word under your cursor.
					--  Useful when your language has ways of declaring types without an actual implementation.
					map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

					-- Jump to the type of the word under your cursor.
					--  Useful when you're not sure what type a variable is and you want to see
					--  the definition of its *type*, not where it was *defined*.
					map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

					-- Fuzzy find all the symbols in your current document.
					--  Symbols are things like variables, functions, types, etc.
					map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

					-- Fuzzy find all the symbols in your current workspace.
					--  Similar to document symbols, except searches over your entire project.
					map(
						"<leader>ws",
						require("telescope.builtin").lsp_dynamic_workspace_symbols,
						"[W]orkspace [S]ymbols"
					)

					-- Rename the variable under your cursor.
					--  Most Language Servers support renaming across files, etc.
					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

					-- Execute a code action, usually your cursor needs to be on top of an error
					-- or a suggestion from your LSP for this to activate.
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

					-- Opens a popup that displays documentation about the word under your cursor
					--  See `:help K` for why this keymap.
					map("K", vim.lsp.buf.hover, "Hover Documentation")
					vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { buffer = event.buf, desc = "LSP: Signature help"})
					--vim.keymap.set('n', '<C-f>', vim.lsp.buf.signature_hep, { buffer = event.buf, desc = 'LSP: Hover Signature'})

					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

					-- The following two autocommands are used to highlight references of the
					-- word under your cursor when your cursor rests there for a little while.
					--    See `:help CursorHold` for information about when this is executed
					--
					-- When you move your cursor, the highlights will be cleared (the second autocommand).
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.server_capabilities.documentHighlightProvider then
						local highlight_augroup =
							vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
							end,
						})
					end

					-- The following autocommand is used to enable inlay hints in your
					-- code, if the language server you are using supports them
					--
					-- This may be unwanted, since they displace some of your code
					if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
						map("<leader>th", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
						end, "[T]oggle Inlay [H]ints")
					end
				end,
			})

			-- LSP servers and clients are able to communicate to each other what features they support.
			--  By default, Neovim doesn't support everything that is in the LSP specification.
			--  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
			--  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			--  Available config keys are:
			--  - cmd (table): Override the default command used to start the server
			--  - filetypes (table): Override the default list of associated filetypes for the server
			--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
			--  - settings (table): Override the default settings passed when initializing the server.
			local servers = {
				-- clangd = {},
				gopls = {
					settings = {
						gopls = {
							usePlaceholders = true,
							analyses = {
								unusedvariable = true,
							},
						},
					},
				},
				lua_ls = {
					-- cmd = {...},
					-- filetypes = { ...},
					-- capabilities = {},
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
							-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
							-- diagnostics = { disable = { 'missing-fields' } },
						},
					},
				},
				pylsp = {
					settings = {
						pylsp = {
							plugins = {
								pycodestyle = {
									enabled = false, -- disable linter warnings
								},
							},
						},
					},
				},
				-- jsonls = {
				--   json = {
				--     schemas = require('custom.plugins.schemastore').json.schemas {
				--       extra = {
				--         {
				--           description = 'Fastfetch Schema',
				--           fileMatch = 'config.jsonc',
				--           name = 'fastfetch.json',
				--           url = 'https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json',
				--         }
				--       },
				--     },
				--     validate = { enable = true },
				--   }
				-- }
			}

      -- GLSL language server
      vim.lsp.enable('glsl_analyzer')
      vim.lsp.config('glsl_analyzer', {
        cmd = { 'glsl_analyzer' },
        filetypes = { 'glsl' },
      })

      vim.lsp.enable('zls')
      vim.lsp.config('zls', {
        -- There are two ways to set config options:
        --   - edit your `zls.json` that applies to any editor that uses ZLS
        --   - set in-editor config options with the `settings` field below.
        -- Further information on how to configure ZLS:
        -- https://zigtools.org/zls/configure/
        settings = {
          zls = {
            -- Neovim already provides basic syntax highlighting
            semantic_tokens = "partial",
          }
        }
      })

      -- Direct LSP commands
			vim.keymap.set("n", "gh", ":LspClangdSwitchSourceHeader<CR>", { desc = "Clangd: Switch Source <-> Header"})

			require("mason").setup()

			-- You can add other tools here that you want Mason to install
			-- for you, so that they are available from within Neovim.
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua", -- Used to format Lua code
			})
			-- require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						-- This handles overriding only values explicitly passed
						-- by the server configuration above. Useful when disabling
						-- certain features of an LSP (for example, turning off formatting for tsserver)
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
