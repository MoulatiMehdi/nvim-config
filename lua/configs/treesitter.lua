---@type vim.treesitter.languagetree.Injection
return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy = false,
        opts = {
            auto_install = true,
            ensure_installed = {
                "git_config",
                "git_rebase",
                "gitattributes",
                "gitcommit",
                "markdown",
                "markdown_inline",
                "query",
                "diff",
                "vim",
                "lua",
                "luadoc",
                "vimdoc",
                "c",
                "bash",
            },
            indent = { enable = true, disable = { "ruby" } },
        },
        config = function(_, opts)
            require("nvim-treesitter.install").prefer_git = true
            require("nvim-treesitter.config").setup(opts)
        end,
    },
}
