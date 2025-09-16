-- Highlight On Yank
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})



-- NOTE: AUTOCOMMANDS
-- inset Guard for a C C++ header
vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = { "*.h", "*.hpp" },
    callback = require "HeaderGuard".insertGuard
})
