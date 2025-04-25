local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local capabilities = require("blink.cmp").get_lsp_capabilities()

-- Enable Mason
mason.setup()
mason_lspconfig.setup({
	ensure_installed = { "html", "cssls", "ts_ls", "tailwindcss", "pyright", "clangd", "jdtls", "astro" },
})

-- Attach function for keybindings & options
local on_attach = function(client, bufnr)
	local opts = { buffer = bufnr, noremap = true, silent = true }
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, { noremap = true, silent = true })
end

-- Setup language servers
mason_lspconfig.setup_handlers({
	function(server_name) -- Default handler
		lspconfig[server_name].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end,
})

-- Additional LSP server configurations
lspconfig.lua_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
		},
	},
})

