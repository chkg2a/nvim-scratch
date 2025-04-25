require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		css = { "prettierd", "prettier", stop_after_first = true },
		html = { "prettierd", "prettier", stop_after_first = true },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		javascriptreact = { "prettierd", "prettier", stop_after_first = true },
		cpp = { "clang-format" },
		python = { "autopep8" },
	},
})
