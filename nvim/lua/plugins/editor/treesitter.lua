return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			{
				'nvim-treesitter/nvim-treesitter-context',
				'windwp/nvim-ts-autotag',
			},
		},

		opts = {
			highlight = { enable = false },
			indent = { enable = true },
			context_commentstring = { enable = true, enable_autocmd = false },
			ensure_installed = {
				"bash",
				"c",
				"css",
				"html",
				"javascript",
				"json",
				"lua",
				"luadoc",
				"luap",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"rust",
				"svelte",
				"tsx",
				"typescript",
				"vim",
				"yaml",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-s>",
					node_incremental = "<C-s>",
					scope_incremental = "<nop>",
					node_decremental = "<bs>",
				},
			},
			autotag = {
				enable = true,
			},
		},

		config = function(_, opts)
			-- folds
			vim.opt.foldmethod = "expr"
			vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
			vim.opt.foldlevel = 99 -- start always unfolded

			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
