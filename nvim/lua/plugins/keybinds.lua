return {
	"folke/which-key.nvim",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 100
	end,
	config = function()
		local wk = require("which-key")

		wk.register({
			["<leader>"] = {
				name = "General commands",
				[";"] = { "<cmd>Telescope commands<cr>", "Commands" },
				["/"] = { "<cmd>Telescope live_grep<cr>", "Search" },
				b = { "<cmd>Telescope buffers<cr>", "Buffers" },
				h = { "<cmd>Telescope help_tags<cr>", "Help" },
				t = { "<cmd>Telescope treesitter<cr>", "Treesitter" },
				p = { "<cmd>Telescope projects<cr>", "Projects" },
				s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
				S = { "<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace Symbols" },
				d = { "<cmd>Telescope lsp_definitions<cr>", "Definitions" },
				D = { "<cmd>Telescope lsp_implementations<cr>", "Implementations" },
				r = { "<cmd>Telescope lsp_references<cr>", "References" },
				a = { "<cmd>Telescope lsp_code_actions<cr>", "Code Actions" },
				m = { "<cmd>Telescope marks<cr>", "Marks" },
				c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
				l = { "<cmd>Telescope loclist<cr>", "Location List" },
				q = { "<cmd>Telescope quickfix<cr>", "Quickfix" },
				g = { "<cmd>Telescope git_status<cr>", "Git Status" },
				G = { "<cmd>Telescope git_commits<cr>", "Git Commits" },
				f = { "<cmd>Telescope git_files<cr>", "Git Files" },
				z = { "<cmd>Telescope git_stash<cr>", "Git Stash" },
				Z = { "<cmd>Telescope git_stashes<cr>", "Git Stashes" },
				x = { "<cmd>Telescope git_bcommits<cr>", "Git BCommits" },
			},
			["f"] = {
				name = "File",
				f = { "<cmd>Telescope find_files<cr>", "Find File" },
				r = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
				n = { "<cmd>enew<cr>", "New File" },
			},
			["g"] = {
				name = "Go to...",
				d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Definition" },
				D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Declaration" },
			}
		});
	end
}
