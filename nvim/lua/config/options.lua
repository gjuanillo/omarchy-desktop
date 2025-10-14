-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Left Column Related Configs
vim.opt.number = true --line numbers
vim.opt.relativenumber = true -- enable relative numbers
vim.opt.numberwidth = 2 --set left column width to 2
vim.opt.signcolumn = "yes" --show left signs "git status, diagnostics, etc"
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8

-- Tab behavior
vim.opt.expandtab = true --convert tabs to spaces
vim.opt.shiftwidth = 4 --number of spaces for each indent
vim.opt.tabstop = 4 --number of spaces for tab character
vim.opt.softtabstop = 4 -- number of spaces inserted for tab key
vim.opt.smartindent = true -- enable smart indentation
vim.opt.breakindent = true -- enable line breaking indentation

--Others
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.conceallevel = 0
vim.opt.fileencoding = "utf-8"
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.timeoutlen = 2000
vim.opt.undofile = true
vim.opt.updatetime = 100
vim.opt.writebackup = false
vim.opt.cursorline = true

-- Searching Configs
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
