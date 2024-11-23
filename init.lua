vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.g.base46_cache = vim.fn.stdpath("data") .. "/nvchad/base46/"

-- Lazy Plugin
require("configs.lazy-bootstrap")
require("configs.lazy-plugins")

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

vim.schedule(function()
	require("options")
	require("mappings")
	require("autocmds")
end)
