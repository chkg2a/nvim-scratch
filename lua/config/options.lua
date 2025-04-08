vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.o.inccommand = "split"
vim.o.relativenumber = true
vim.o.number = true
vim.o.conceallevel = 1

vim.opt.undofile = true  -- Enable persistent undo
vim.opt.expandtab = true      -- Convert tabs to spaces
vim.opt.shiftwidth = 2        -- Number of spaces per indentation level
vim.opt.tabstop = 2           -- Number of spaces per tab
vim.opt.softtabstop = 2       -- Backspace key treats indentation as 2 spaces
vim.o.scrolloff = 5  -- Adjust this number as needed

vim.opt.clipboard = "unnamedplus"
vim.opt.shada = "!,'1000,<50,s10,h"
