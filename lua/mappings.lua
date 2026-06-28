require "nvchad.mappings"

local map = vim.keymap.set
-- Exit Terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Disable Search Highlight
map('n', '<Esc>', '<cmd>nohlsearch<CR>')
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })


map({ 'n', 'v' }, '<leader>ca', function()
    vim.lsp.buf.code_action({ apply = true })
end, { desc = '[C]ode [A]ction' })

