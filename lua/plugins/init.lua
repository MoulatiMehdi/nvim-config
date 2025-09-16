return {
    -- {
    --     "MoulatiMehdi/42norm.nvim",
    --     ft = { "c", "cpp" },  -- Only load the plugin for .c and .cpp files
    --     lazy = false,
    --     config = function()
    --         require("configs.42norm")
    --     end
    -- },
    -- require "configs.autopairs",
    { import = "nvchad.blink.lazyspec" },
    require"configs.HeaderGuard",
    require "configs.cmp",
    require "configs.mini",
    require "configs.todo",
    require "configs.mason",
    require "configs.conform",
    require "configs.lspconfig",
    require "configs.treesitter",
    require "configs.telescope",
}
