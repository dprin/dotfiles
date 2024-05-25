-- straight up, this is stolen from:
-- https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/lazy/colors.lua
-- (latest commit that changed that file was ac393a2)
function ResetBackground(theme)
	theme = theme or "rose-pine"
	vim.cmd.colorscheme(theme)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
end

return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function ()
			require("rose-pine").setup({
				variant = "auto",
				dark_variant = "main",
				dim_inactive_windows = false,
				extend_background_behind_borders = true,

				enable = {
					terminal = true,
					migrations = true, -- Handle deprecated options automatically
				},

				styles = {
					bold = true,
					italic = true,
					transparency = false,
				},

				groups = {
					border = "muted",
					link = "iris",
					panel = "surface",

					error = "love",
					hint = "iris",
					info = "foam",
					note = "pine",
					todo = "rose",
					warn = "gold",

					git_add = "foam",
					git_change = "rose",
					git_delete = "love",
					git_dirty = "rose",
					git_ignore = "muted",
					git_merge = "iris",
					git_rename = "pine",
					git_stage = "iris",
					git_text = "rose",
					git_untracked = "subtle",

					h1 = "iris",
					h2 = "foam",
					h3 = "rose",
					h4 = "gold",
					h5 = "pine",
					h6 = "foam",
				},

				highlight_groups = {
					-- Comment = { fg = "foam" },
					VertSplit = { fg = "muted", bg = "muted" },
				},
			})

			ResetBackground()
		end,
	},
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
