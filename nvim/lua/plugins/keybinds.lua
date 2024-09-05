return {
	"folke/which-key.nvim",
	dependencies = {
		{ 'echasnovski/mini.icons', version = false },
	},
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 100
	end,
	keys = {
		{ "<leader>",   group = "General commands" },
		{ "<leader>;",  "<cmd>Telescope commands<cr>",                  desc = "Commands" },
		{ "<leader>f",  group = "Files" },
		{ "<leader>f/", "<cmd>Telescope live_grep<cr>",                 desc = "Search" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>",                   desc = "Buffers" },
		{ "<leader>ff", "<cmd>Telescope find_files<cr>",                desc = "Find file" },
		{ "<leader>g",  group = "Git commands" },
		{ "<leader>gG", "<cmd>Telescope git_commits<cr>",               desc = "Git Commits" },
		{ "<leader>gZ", "<cmd>Telescope git_stashes<cr>",               desc = "Git Stashes" },
		{ "<leader>gf", "<cmd>Telescope git_files<cr>",                 desc = "Git Files" },
		{ "<leader>gg", "<cmd>Neogit<cr>",                              desc = "Neogit" },
		{ "<leader>gx", "<cmd>Telescope git_bcommits<cr>",              desc = "Git BCommits" },
		{ "<leader>gz", "<cmd>Telescope git_stash<cr>",                 desc = "Git Stash" },
		{ "<leader>h",  "<cmd>Telescope help_tags<cr>",                 desc = "Help" },
		{ "<leader>l",  group = "LSP Commands" },
		{ "<leader>la", vim.lsp.buf.code_action,                        desc = "Code action" },
		{ "<leader>ld", vim.lsp.buf.definition,                         desc = "Definitions" },
		{ "<leader>le", vim.diagnostic.goto_next,                       desc = "Diagnostics" },
		{ "<leader>lf", vim.lsp.buf.format,                             desc = "Format" },
		{ "<leader>lh", vim.lsp.buf.hover,                              desc = "Hover" },
		{ "<leader>li", "<cmd>Telescope lsp_implementations<cr>",       desc = "Implementations" },
		{ "<leader>lr", desc = "Rename" },
		{ "<leader>o",  group = "Neorg Binds" },
		{ "<leader>oc", "<Plug>(neorg.qol.todo-items.todo.task-cycle)", desc = "Cycle todo item" },
		{ "<leader>og", "<Plug>(neorg.esupports.hop.hop-link)",         desc = "Goto link" },
		{ "<leader>t",  "<cmd>NvimTreeToggle<cr>",                      desc = "Toggle nvim-tree" },
	},
}
