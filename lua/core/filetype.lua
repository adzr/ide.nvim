vim.filetype.add({
	pattern = {
		["containerfile"] = "dockerfile",
		[".*.containerfile"] = "dockerfile",
	},
})
