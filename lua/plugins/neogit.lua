return {
	"NeogitOrg/neogit",
	lazy = true,
	dependencies = {
		"esmuellert/codediff.nvim",
		"m00qek/baleia.nvim",
		"folke/snacks.nvim",
	},
	cmd = "Neogit",
	config = function()
		require("neogit").setup({
			kind = "tab", -- Opens the main dashboard in a clean, focused tab page

			-- 🌟 THE INTEGRATION MATRIX
			integrations = {
				diffview = false, -- Explicitly deactivate the old diffview layer
				codediff = true, -- 🚀 Activate your premium, C-accelerated code comparison engine!
				snacks = true,
				mini_pick = false,
				fzf_lua = false,
				telescope = false,
			},
		})
	end,
	keys = {
		{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" },
	},
}
