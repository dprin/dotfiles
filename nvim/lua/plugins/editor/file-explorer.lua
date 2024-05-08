return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-frecency.nvim",
			"kkharji/sqlite.lua",
		},
		config = function()
			require("telescope").load_extension("frecency")
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		config = function() 
			require("nvim-tree").setup({
				actions = {
					open_file = {
						quit_on_open = true,
					},
				},
			})
		end,
	},
}
