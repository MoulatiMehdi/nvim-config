vim.g.mapleader = " "
vim.g.have_nerd_front = true
vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "configs.lazy-bootstrap"
require "configs.lazy-plugins"
require "nvchad.autocmds"

vim.schedule(function()
	require "autocmds"
	require "mappings"
end)
