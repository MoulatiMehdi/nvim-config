require "nvchad.options"

-- Variables
local opt = vim.opt
local backup_dir = vim.fn.stdpath "data" .. "/backup//"
local undo_dir = vim.fn.stdpath "data" .. "/undo//"
local swap_dir = vim.fn.stdpath "data" .. "/swap//"


-- Directories
vim.fn.mkdir(backup_dir, "p")
vim.fn.mkdir(undo_dir, "p")
vim.fn.mkdir(swap_dir, "p")

-- Options
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.numberwidth = 5

opt.hlsearch = true
opt.number = true
opt.relativenumber = true

vim.opt.cursorline = true
vim.opt.cursorlineopt = "line" -- to enable cursorline!

opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.showmode = false
opt.clipboard = "unnamedplus"
opt.breakindent = true

-- Backup
opt.backup = true
opt.backupdir = backup_dir
opt.undofile = true
opt.undodir = undo_dir
opt.directory = swap_dir

opt.ignorecase = true
opt.smartcase = true

opt.signcolumn = "yes"
opt.updatetime = 250
opt.timeoutlen = 300

opt.splitright = true
opt.splitbelow = true

opt.list = false
-- opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

opt.inccommand = "split"
opt.cursorline = true
opt.scrolloff = 10
