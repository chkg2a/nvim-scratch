require("codecompanion").setup({
	adapters = {
		gemini = function()
			return require("codecompanion.adapters").extend("gemini", {
				env = {
					api_key = vim.fn.getenv("GEMINI_API_KEY"),
				},
			})
		end,
	},
	strategies = {
		chat = {
			adapter = "gemini",
		},
		inline = {
			adapter = "gemini",
		},
		cmd = {
			adapter = "gemini",
		},
	},
})
