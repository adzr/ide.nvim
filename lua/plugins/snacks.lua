return {
	{
		"folke/snacks.nvim",
		priority = 1000, -- Initialize at the very beginning of the startup sequence
		lazy = false,
		opts = {
			-- 🚀 THE MINIMUM HIGH-PERFORMANCE PLUGINS
			bigfile = { enabled = true }, -- Protects memory buffer scaling
			explorer = { enabled = true }, -- Your native file tree sidebar
			picker = {
				enabled = true,
				sources = {
					explorer = {
						win = {
							list = {
								keys = {
									-- Fix the list block map so PageDown moves down and PageUp moves up cleanly
									["<PageDown>"] = "list_scroll_down",
									["<PageUp>"] = "list_scroll_up",
								},
							},
						},
					},
				},
			}, -- Ultra-fast fuzzy finder (rg/fd)
			terminal = { enabled = true, cmd = "/bin/bash" }, -- Quake-style togglable terminal shell
			words = { enabled = true },
			lazygit = { enabled = true },
			statuscolumn = { enabled = true }, -- Prettifies your left-hand line gutters!
			-- 🚫 DISABLE ALL NON-ESSENTIAL MODULES
			animate = { enabled = false },
			dashboard = { enabled = false },
			dim = { enabled = false },
			indent = { enabled = false }, -- (Your indent-blankline v3 handles this)
			input = { enabled = false },
			layout = { enabled = false },
			notifier = { enabled = false },
			notify = { enabled = false },
			profiler = { enabled = false },
			quickfile = { enabled = false },
			scope = { enabled = false },
			scratch = { enabled = false },
			scroll = { enabled = false },
			image = { enabled = false },
		},
		keys = {
			-- Minimal, intuitive key bindings to drive your entire workspace
			{
				"<leader>e",
				function()
					Snacks.explorer()
				end,
				desc = "Toggle File Tree",
			},
			{
				"<leader>sf",
				function()
					Snacks.picker.files()
				end,
				desc = "Find Workspace Files",
			},
			{
				"<leader>sg",
				function()
					Snacks.picker.grep()
				end,
				desc = "Live Grep Workspace Text",
			},
			{
				"<C-\\>",
				function()
					Snacks.terminal.toggle()
				end,
				mode = { "n", "t" },
				desc = "Toggle Floating Terminal",
			},
		},
	},
}
