return {
	{
		"ravsii/tree-sitter-d2",
		-- This relies on standard system make utilities, bypassing the broken zip downloads
		build = "make nvim-install",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
}
