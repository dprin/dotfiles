return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"arkav/lualine-lsp-progress", -- look at the name
		},

		event = "VimEnter",

		opts = {
			options = {
				ignore_focus = { "neo-tree", "neo-tree-popup", "notify" },
			},
			sections = {
				lualine_a = { 'mode' },
				lualine_b = {
					{
						'diagnostics',
						sources = { 'nvim_lsp' },
					},
				},
				lualine_c = {
					'lsp_progress'
				},

				lualine_x = { 'fileformat', 'encoding' },
				lualine_y = { 'branch', 'diff' },
				lualine_z = { 'location', 'filename' },
			}
		}
	}
}
