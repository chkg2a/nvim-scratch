local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local capabilities = require("blink.cmp").get_lsp_capabilities()

-- Enable Mason
mason.setup()

-- Install servers
mason_lspconfig.setup({
  ensure_installed = {
    "lua_ls",
    "html",
    "cssls",
    "ts_ls",
    "tailwindcss",
    "pyright",
    "clangd",
    "jdtls",
    "astro",
    "gopls",
    "sqls",
  },

  -- NEW IN V2 – automatically enables servers using vim.lsp.enable()
  automatic_enable = true,
})

-- Shared on_attach function
local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, noremap = true, silent = true }

  -- Navigation
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)

  -- Info
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

  -- Diagnostics
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
end

---------------------------------------------------------------------
-- NEW NATIVE NEOVIM 0.11 LSP CONFIGURATION
-- Each server is defined using vim.lsp.config()
-- mason-lspconfig v2 will automatically enable them
---------------------------------------------------------------------

-- LUA LS
vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim", "require" },
      },
    },
  },
})

-- HTML
vim.lsp.config("html", {
  capabilities = capabilities,
  on_attach = on_attach,
})

-- CSS
vim.lsp.config("cssls", {
  capabilities = capabilities,
  on_attach = on_attach,
})

-- TypeScript
vim.lsp.config("ts_ls", {
  capabilities = capabilities,
  on_attach = on_attach,
})

-- Tailwind CSS
vim.lsp.config("tailwindcss", {
  capabilities = capabilities,
  on_attach = on_attach,
})

-- Python
vim.lsp.config("pyright", {
  capabilities = capabilities,
  on_attach = on_attach,
})

-- C/C++
vim.lsp.config("clangd", {
  capabilities = capabilities,
  on_attach = on_attach,
})

-- Java
vim.lsp.config("jdtls", {
  capabilities = capabilities,
  on_attach = on_attach,
})

-- Astro
vim.lsp.config("astro", {
  capabilities = capabilities,
  on_attach = on_attach,
})

-- Go
vim.lsp.config("gopls", {
  capabilities = capabilities,
  on_attach = on_attach,
})

-- SQL
vim.lsp.config("sqls", {
  capabilities = capabilities,
  on_attach = on_attach,
})
