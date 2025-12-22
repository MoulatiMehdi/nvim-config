return {
    "MoulatiMehdi/42norm.nvim",
    ft = { "c" }, -- Only load the plugin for .c and .cpp files
    lazy = false,
    config = function()
        local norm = require("42norm")

        norm.setup({
            header_on_save = false,
            format_on_save = true,
            liner_on_change = true,
        })

        vim.keymap.set("n", "<F1>", function()
            norm.stdheader()
        end, { desc = "Norminette Format", noremap = true, silent = true })
        vim.keymap.set("n", "<F5>", function()
            norm.format()
        end, { desc = "Insert 42header", noremap = true, silent = true })

        -- create your commands
        vim.api.nvim_create_user_command("Stdheader", function()
            norm.stdheader()
        end, {})
        vim.api.nvim_create_user_command("Norminette", function()
            norm.check_norms()
        end, {})
        vim.api.nvim_create_user_command("Format", function()
            norm.format()
        end, {})
    end
}
