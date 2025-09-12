local norm = require("42norm")

norm.setup({
    header_on_save = false,
    format_on_save = true,
    liner_on_change = true,
})
vim.api.nvim_create_user_command("Stdheader", function()
    norm.stdheader()
end, {})

vim.keymap.set("n", "<F1>", function()
    norm.stdheader()
end, { desc = "Insert 42header", noremap = true, silent = true })

if vim.bo.filetype == "c" or vim.bo.filetype == "cpp" then
    -- create your commands
    vim.api.nvim_create_user_command("Norminette", function()
        norm.check_norms()
    end, {})
    vim.api.nvim_create_user_command("42Format", function()
        norm.format()
    end, {})
end
