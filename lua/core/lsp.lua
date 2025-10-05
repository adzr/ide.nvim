vim.lsp.config("luals", {
	-- Command and arguments to start the server.
	cmd = { "lua-language-server" },
	-- Filetypes to automatically attach to.
	filetypes = { "lua" },
	-- Sets the "workspace" to the directory where any of these files is found.
	-- Files that share a root directory will reuse the LSP server connection.
	-- Nested lists indicate equal priority, see |vim.lsp.Config|.
	root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
	-- Specific settings to send to the server. The schema is server-defined.
	-- Example: https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
		},
	},
})

vim.lsp.config("rust_analyzer", {
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	root_markers = { { "Cargo.lock", "Cargo.toml" }, ".git" },
	settings = {
		["rust-analyzer"] = {},
	},
})

vim.lsp.config("buck2", {
	cmd = { "buck2 lsp" },
	filetypes = { "BUCK", ".buckroot", ".buckconfig", ".buckconfig.*" },
	root_markers = { ".buckroot", ".git" },
	settings = {
		["rust-analyzer"] = {},
	},
})

vim.lsp.enable("luals")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("buck2")
