return {
	"NLKNguyen/papercolor-theme",
	"savq/melange-nvim",
	{
		"nyoom-engineering/oxocarbon.nvim",
		config = function ()
			vim.opt.background = "dark"
			vim.cmd.colorscheme "oxocarbon"
		end
	},

	-- Neovim plugin to improve the default vim.ui interfaces
	{
		"stevearc/dressing.nvim",
			event = "VeryLazy",
			opts = {
				input = {
					insert_only = false,
					start_in_insert = true,
				},
				select = {
				backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },
			}
		}
	},
}
