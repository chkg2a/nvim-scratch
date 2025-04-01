vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.o.relativenumber = true
vim.o.number = true

vim.opt.undofile = true  -- Enable persistent undo
vim.opt.expandtab = true      -- Convert tabs to spaces
vim.opt.shiftwidth = 2        -- Number of spaces per indentation level
vim.opt.tabstop = 2           -- Number of spaces per tab
vim.opt.softtabstop = 2       -- Backspace key treats indentation as 2 spaces

vim.opt.clipboard = "unnamedplus"
vim.opt.shada = "!,'1000,<50,s10,h"
