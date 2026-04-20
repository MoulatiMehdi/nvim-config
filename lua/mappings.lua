require "nvchad.mappings"
require "HeaderGuard"


local map = vim.keymap.set
-- Exit Terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Disable Search Highlight
map('n', '<Esc>', '<cmd>nohlsearch<CR>')
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })


map({ 'n', 'v' }, '<leader>ca', function()
    vim.lsp.buf.code_action({ apply = true })
end, { desc = '[C]ode [A]ction' })

-- Save
-- -- Press "F5" key to run the norminette
-- vim.keymap.set("n", "<F5>", function()
--         norm.check_norms()
-- end, { desc = "Update 42norms diagnostics", noremap = true, silent = true })
--
-- vim.keymap.set("n", "<C-f>", function()
--     norm.format()
-- end, { desc = "Format buffer on 42norms", noremap = true, silent = true })
