return {
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{ 'williamboman/mason.nvim', },
			{ 'williamboman/mason-lspconfig.nvim', },
		},
		config = function()
			require('mason').setup {}

			-- Install default language servers
			require('mason-lspconfig').setup {
				ensure_installed = { 'basedpyright', 'lua_ls' },
			}

			-- Setup language servers.
			local lspconfig = require('lspconfig')
			lspconfig.basedpyright.setup {
				settings = {
					basedpyright = {
						analysis = {
							-- basedpyright does not support a global config file, so the settings are here
							diagnosticSeverityOverrides = {
								reportUnusedImport = 'information',
								reportUnknownArgumentType = 'none',
								reportUnknownVariableType = 'none',
								reportUnknownMemberType = 'none',
								reportUnknownParameterType = 'none',
								reportUnknownLambdaType = 'none',
								reportMissingParameterType = 'none',
								reportUntypedFunctionDecorator = 'none',
								reportExplicitAny = 'none',
								reportAny = 'none',
							}
						}
					}
				}
			}
			lspconfig.dockerls.setup {}
			lspconfig.lua_ls.setup {}
			lspconfig.postgres_lsp.setup {}
			lspconfig.rust_analyzer.setup {
				-- Server-specific settings. See `:help lspconfig-setup`
				settings = {
					['rust-analyzer'] = {},
				},
			}
			lspconfig.salt_ls.setup {
				cmd = { 'salt-lsp' },
			}
			lspconfig.yamlls.setup {}
		end,
	},

	{
		'hrsh7th/nvim-cmp',
		event = 'InsertEnter',
		dependencies = {
			{ 'hrsh7th/cmp-nvim-lsp', },
			{ 'hrsh7th/cmp-nvim-lsp-signature-help', },
			{ 'hrsh7th/cmp-nvim-lua', },
			{ 'hrsh7th/cmp-vsnip',                   enable = false, },
			{ 'hrsh7th/cmp-path', },
			{ 'hrsh7th/cmp-buffer', },
			{ 'hrsh7th/vim-vsnip',                   enable = false, },
		},
		config = function()
			-- Completion Plugin Setup
			local cmp = require('cmp')
			cmp.setup({
				-- Enable LSP snippets
				snippet = {
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body)
					end,
				},
				mapping = {
					['<C-p>'] = cmp.mapping.select_prev_item(),
					['<C-n>'] = cmp.mapping.select_next_item(),
					-- Add tab support
					['<S-Tab>'] = cmp.mapping.select_prev_item(),
					['<Tab>'] = cmp.mapping.select_next_item(),
					['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.close(),
					--		['<CR>'] = cmp.mapping.confirm({
					--			behavior = cmp.ConfirmBehavior.Insert,
					--			select = true,
					--		})
				},
				-- Installed sources:
				sources = {
					{ name = 'path' },                             -- file paths
					{ name = 'nvim_lsp',               keyword_length = 3 }, -- from language server
					{ name = 'nvim_lsp_signature_help' },          -- display function signatures with current parameter emphasized
					{ name = 'nvim_lua',               keyword_length = 2 }, -- complete neovim's Lua runtime API such vim.lsp.*
					{ name = 'buffer',                 keyword_length = 2 }, -- source current buffer
					{ name = 'vsnip',                  keyword_length = 2 }, -- nvim-cmp source for vim-vsnip
					{ name = 'calc' },                             -- source for math calculation
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				formatting = {
					fields = { 'menu', 'abbr', 'kind' },
					format = function(entry, item)
						local menu_icon = {
							nvim_lsp = 'λ',
							vsnip = '⋗',
							buffer = 'Ω',
							path = '🖫',
						}
						item.menu = menu_icon[entry.source.name]
						return item
					end,
				},
			})
		end,
	},

	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		config = function()
			-- Treesitter Plugin Setup
			require('nvim-treesitter.configs').setup {
				ensure_installed = { "bash", "fish", "lua", "python", "rust", "sql", "toml", "yaml" },
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				ident = { enable = true },
				rainbow = {
					enable = true,
					extended_mode = true,
					max_file_lines = nil,
				}
			}
			-- Treesitter folding
			--vim.wo.foldmethod = 'expr'
			--vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
		end,
	},
}
