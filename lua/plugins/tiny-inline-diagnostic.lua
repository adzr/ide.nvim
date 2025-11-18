return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	priority = 1000,
	config = function()
		require("tiny-inline-diagnostic").setup({
			preset = "powerline",
			options = {
				multilines = {
					enabled = true,
				},
				virt_texts = {
					priority = 50000,
				},
			},
		})
		vim.diagnostic.config({
			virtual_text = false,
		}) -- Disable Neovim's default virtual text diagnostics
	end,
}
