local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "ts_ls", "tailwindcss", "cssls", "pyright", "clangd", "jdtls", "astro" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({})
end
