local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

-- Enable Mason
mason.setup()
mason_lspconfig.setup({
    ensure_installed = { "html", "cssls", "ts_ls", "tailwindcss", "cssls", "pyright", "clangd", "jdtls", "astro" }
})

-- Attach function for keybindings & options
local on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, noremap = true, silent = true }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end

-- Setup language servers
mason_lspconfig.setup_handlers({
    function(server_name) -- Default handler
        lspconfig[server_name].setup({
            on_attach = on_attach,
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
        })
    end,
})

-- Additional LSP server configurations
lspconfig.lua_ls.setup({
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
        },
    },
})
