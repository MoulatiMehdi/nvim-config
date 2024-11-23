
require "nvchad.options"

local opt = vim.opt
local backup_dir = vim.fn.stdpath 'data' .. '/backup//'
local undo_dir = vim.fn.stdpath 'data' .. '/undo//'
local swap_dir = vim.fn.stdpath 'data' .. '/swap//'

-- Create directories if they don't exist
vim.fn.mkdir(backup_dir, 'p')
vim.fn.mkdir(undo_dir, 'p')
vim.fn.mkdir(swap_dir, 'p')


opt.expandtab = true;
opt.shiftwidth = 4;
opt.tabstop = 4;

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

opt.number = true
opt.relativenumber = true
opt.mouse = 'a'
opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
opt.clipboard = 'unnamedplus'
opt.breakindent = true
opt.backup = true
opt.backupdir = backup_dir
opt.undofile = true
opt.undodir = undo_dir
opt.directory = swap_dir -- Set swap directory

opt.ignorecase = true
opt.smartcase = true
opt.signcolumn = 'yes'
opt.updatetime = 250
opt.timeoutlen = 300

opt.splitright = true
opt.splitbelow = true

opt.list = false
-- opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

opt.inccommand = 'split'
opt.cursorline = true
opt.scrolloff = 10

-- vim: ts=2 sts=2 sw=2 et
