return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"davidmh/cspell.nvim",
	},
	event = "VeryLazy",
	opts = function(_, opts)
		local none_ls = require("null-ls")
		local cspell = require("cspell")

		opts.sources = opts.sources or {}
		table.insert(
			opts.sources,
			cspell.diagnostics.with({
				diagnostics_postprocess = function(diagnostic)
					diagnostic.severity = vim.diagnostic.severity.HINT
				end,
			})
		)
		table.insert(
			opts.sources,
			cspell.code_actions.with({
				config = {
					config_file_preferred_name = "cspell.json",
					diagnostics_postprocess = function(diagnostic)
						diagnostic.severity = vim.diagnostic.severity.HINT
					end,
				},
			})
		)
		table.insert(opts.sources, none_ls.builtins.formatting.stylua)
		table.insert(opts.sources, none_ls.builtins.completion.spell)
		table.insert(opts.sources, none_ls.builtins.code_actions.gitrebase)
		table.insert(opts.sources, none_ls.builtins.code_actions.gitsigns)
		table.insert(opts.sources, none_ls.builtins.code_actions.textlint)
	end,
}
