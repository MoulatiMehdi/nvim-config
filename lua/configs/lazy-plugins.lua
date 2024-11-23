require("lazy").setup({
    defaults = { lazy = true },
    install = { colorscheme = { "nvchad" } },
    {
        "NvChad/NvChad",
        lazy = false,
        branch = "v2.5",
        import = "nvchad.plugins",
        config = function()
            require "options"
        end,
    },
    "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
    "nvim-tree/nvim-web-devicons",
    {
        "folke/trouble.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        }, -- Ensure you have the icons dependency
        opts = { -- Configuration options for trouble.nvim
            use_diagnostic_signs = true, -- enable diagnostics icons
            indent_lines = true, -- add indent guide below the fold icons
        }, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>dd",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "[D]iagnostics (Trouble)",
            },
            {
                "<leader>db",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "[D]iagnostics [B]uffer (Trouble)",
            },
            {
                "<leader>ds",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>la",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "[L]SP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>ll",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "[L]ocation [L]ist (Trouble)",
            },
            {
                "<leader>ql",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "[Q]uickfix [L]ist (Trouble)",
            },
        },
    },
    {
        "ThePrimeagen/harpoon", -- Harpoon (file navigator)
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require "harpoon"
            harpoon:setup()
            -- keymaps for harpoon
            vim.keymap.set("n", "<leader>a", function()
                harpoon:list():add()
            end)
            vim.keymap.set("n", "<C-e>", function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end)

            -- Toggle previous & next buffers stored within Harpoon list
            vim.keymap.set("n", "<C-P>", function()
                harpoon:list():prev()
            end)
            vim.keymap.set("n", "<C-N>", function()
                harpoon:list():next()
            end)
        end,
    },
    require "plugins.lspconfig",
    require "plugins.treesitter",
    require "plugins.conform",
}, {
    ui = {
        -- If you are using a Nerd Font: set icons to an empty table which will use the
        -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
        icons = vim.g.have_nerd_font and {} or {
            cmd = "⌘",
            config = "🛠",
            event = "📅",
            ft = "📂",
            init = "⚙",
            keys = "🗝",
            plugin = "🔌",
            runtime = "💻",
            require = "🌙",
            source = "📄",
            start = "🚀",
            task = "📌",
            lazy = "💤 ",
        },
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "2html_plugin",
                "tohtml",
                "getscript",
                "getscriptPlugin",
                "gzip",
                "logipat",
                -- "netrw",
                -- "netrwPlugin",
                -- "netrwSettings",
                -- "netrwFileHandlers",
                "matchit",
                "tar",
                "tarPlugin",
                "rrhelper",
                "spellfile_plugin",
                "vimball",
                "vimballPlugin",
                "zip",
                "zipPlugin",
                "tutor",
                "rplugin",
                "syntax",
                "synmenu",
                "optwin",
                "compiler",
                "bugreport",
                "ftplugin",
            },
        },
    },
})

-- vim: ts=2 sts=2 sw=2 et
