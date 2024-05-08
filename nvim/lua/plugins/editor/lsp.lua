return {
	{
		'github/copilot.vim'
	},
	{
		'jbyuki/nabla.nvim',
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufRead", "BufNewFile" },
		dependencies = {
			"nvim-lua/lsp-status.nvim",          -- status bar

			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",

			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			"folke/neodev.nvim",
		},

		config = function()
			require("neodev").setup({

			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require('lspconfig')

			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"clangd",
				},
				handlers = {
					function(server_name)
						if server_name == "clangd" then
							lspconfig[server_name].setup {
								capabilities = capabilities,
								cmd = { "clangd", "--offset-encoding=utf-16" },
							}
						else
							lspconfig[server_name].setup {
								capabilities = capabilities,
							}
						end
					end,
				}
			})

			-- luasnip setup
			local luasnip = require('luasnip')

			-- nvim-cmp setup
			local cmp = require('cmp')
			cmp.setup {
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},

				mapping = cmp.mapping.preset.insert({
					['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
					['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
					['<CR>'] = cmp.mapping.confirm {
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					},
				}),

				sources = {
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
				},
			}
		end,
	},

	-- top status bar
	{
		"glepnir/lspsaga.nvim",
		event = "LspAttach",
		config = function()
			require("lspsaga").setup({})
		end,
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			--Please make sure you install markdown and markdown_inline parser
			{ "nvim-treesitter/nvim-treesitter" }
		}
	}
}
