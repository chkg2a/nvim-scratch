vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.o.inccommand = "split"
vim.o.relativenumber = true
vim.o.number = true
vim.o.conceallevel = 1

vim.o.ignorecase = true      -- Case-insensitive search
vim.o.smartcase = true       -- If uppercase in search, switch to sensitive

vim.opt.undofile = true  -- Enable persistent undo
vim.opt.expandtab = true      -- Convert tabs to spaces
vim.opt.shiftwidth = 2        -- Number of spaces per indentation level
vim.opt.tabstop = 2           -- Number of spaces per tab
vim.opt.softtabstop = 2       -- Backspace key treats indentation as 2 spaces
vim.o.scrolloff = 5  -- Adjust this number as needed

vim.opt.clipboard = "unnamedplus"
vim.opt.shada = "!,'1000,<50,s10,h"
vim.opt.wrap = false

vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/luarocks.nvim")

package.path = package.path
  .. ";" .. vim.fn.stdpath("data") .. "/lazy/luarocks.nvim/.rocks/share/lua/5.1/?.lua"
  .. ";" .. vim.fn.stdpath("data") .. "/lazy/luarocks.nvim/.rocks/share/lua/5.1/?/init.lua"

package.cpath = package.cpath
  .. ";" .. vim.fn.stdpath("data") .. "/lazy/luarocks.nvim/.rocks/lib/lua/5.1/?.so"
