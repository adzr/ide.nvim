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

		none_ls.setup({
			sources = {
				none_ls.builtins.formatting.stylua,
				none_ls.builtins.completion.spell,
				cspell.diagnostics.with({ config = config }),
				cspell.code_actions.with({ config = config }),
			},
		})
	end,
}
