local config = {
	config_file_preferred_name = "cspell.json",
}

return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"davidmh/cspell.nvim",
	},
	config = function()
		local none_ls = require("null-ls")
		local cspell = require("cspell")

		local cspell_diagnostics = cspell.diagnostics.with({ config = config })
		local cspell_code_actions = cspell.code_actions.with({ config = config })

		none_ls.setup({
			sources = {
				none_ls.builtins.formatting.stylua,
				none_ls.builtins.completion.spell,
				none_ls.builtins.code_actions.gitrebase,
				none_ls.builtins.code_actions.gitsigns,
				none_ls.builtins.code_actions.textlint,
				cspell_diagnostics,
				cspell_code_actions,
			},
		})
	end,
}
