return {
    "MoulatiMehdi/HeaderGuard.nvim",
    config = function()
        M = require("HeaderGuard")

        -- NOTE: Keybinding
        vim.keymap.set({ "n", "v", "t" }, "<leader>gi", M.insertGuard,
            { desc = "[G]uard [I]nsert", buffer = true })

        -- NOTE: AUTOCOMMANDS
        vim.api.nvim_create_autocmd({"BufWinEnter","BufNewFile"}, {
            pattern = { "*.h", "*.hpp" },
            callback = M.insertGuard,
        })
    end
}
