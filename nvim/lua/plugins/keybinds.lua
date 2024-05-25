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
				g = {
					name = "Git commands",
					g = { "<cmd>Neogit<cr>", "Neogit" },
					f = { "<cmd>Telescope git_files<cr>", "Git Files" },
					G = { "<cmd>Telescope git_commits<cr>", "Git Commits" },
					z = { "<cmd>Telescope git_stash<cr>", "Git Stash" },
					Z = { "<cmd>Telescope git_stashes<cr>", "Git Stashes" },
					x = { "<cmd>Telescope git_bcommits<cr>", "Git BCommits" },
				},
				l = {
					name = "LSP Commands",
					d = { vim.lsp.buf.definition, "Definitions" },
					e = { "<cmd>Lspsaga show_cursor_diagnostics<cr>", "Diagnostics" },
					E = { "<cmd>Lspsaga show_buf_diagnostics<cr>", "Diagnostics" },
					i = { "<cmd>Telescope lsp_implementations<cr>", "Implementations" },
					a = { vim.lsp.buf.code_action, "Code action" },
					f = { vim.lsp.buf.format, "Format" },
					h = { vim.lsp.buf.hover, "hover" },
				},
				f = {
					name = "Files",
					["/"] = { "<cmd>Telescope live_grep<cr>", "Search" },
					b = { "<cmd>Telescope buffers<cr>", "Buffers" },

				},
				[";"] = { "<cmd>Telescope commands<cr>", "Commands" },
				h = { "<cmd>Telescope help_tags<cr>", "Help" },
				t = { "<cmd>NvimTreeToggle<cr>", "Toggle nvim-tree" },
			},
		});
	end
}

