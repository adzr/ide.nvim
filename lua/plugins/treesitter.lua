return {
	{
		-- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		event = "VeryLazy",

		-- [[ Configure Treesitter ]] See `:help nvim-treesitter`
		config = function()
			require("nvim-treesitter").setup({
				ensure_installed = {
					"bash",
					"c",
					"rust",
					"diff",
					"html",
					"json",
					"lua",
					"luadoc",
					"markdown",
					"markdown_inline",
					"d2",
					"query",
					"vim",
					"vimdoc",
					"css",
					"javascript",
					"scss",
					"tsx",
					"regex",
					"dockerfile",
				},
				-- Autoinstall languages that are not installed
				auto_install = true,
				sync_install = false,
				highlight = {
					enable = true,
					-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
					--  If you are experiencing weird indenting issues, add the language to
					--  the list of additional_vim_regex_highlighting and disabled languages for indent.
					additional_vim_regex_highlighting = { "ruby" },
				},
				indent = { enable = true, disable = { "ruby" } },
			})
		end,
	},
}
