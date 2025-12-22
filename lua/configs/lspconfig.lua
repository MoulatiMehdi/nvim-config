-- EXAMPLE
local nvchad_lsp = require "nvchad.configs.lspconfig"
local lspconfig = vim.lsp.config

local on_attach = nvchad_lsp.on_attach
local on_init = nvchad_lsp.on_init
local capabilities = nvchad_lsp.capabilities
local servers = { "clangd", "bashls", "lua_ls" }

return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "williamboman/mason.nvim", config = true },
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            { "j-hui/fidget.nvim",       opts = {} },
            {
                "folke/lazydev.nvim",
                ft = "lua",
                opts = {
                    library = {
                        -- Load luvit types when the `vim.uv` word is found
                        { path = "luvit-meta/library", words = { "vim%.uv" } },
                    },
                },
            },
            { "Bilal2453/luvit-meta", lazy = true },
        },
        config = function()
            vim.diagnostic.config {
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = " ",
                        [vim.diagnostic.severity.WARN] = " ",
                        [vim.diagnostic.severity.INFO] = " ",
                        [vim.diagnostic.severity.HINT] = " ",
                    },
                },
            }

            require("mason").setup()
            require("mason-tool-installer").setup {
                ensure_installed = servers,
            }
            nvchad_lsp.defaults()
            for _, lsp in ipairs(servers) do
                if lsp == "clangd" then
                    lspconfig[lsp] = {
                        on_attach = on_attach,
                        on_init = on_init,
                        capabilities = capabilities,
                        cmd = {
                            "clangd",
                            "--fallback-style=none",
                            "--clang-tidy",
                            "--background-index",
                            "--function-arg-placeholders=disabled",
                            "--compile-commands-dir=.",
                            "--header-insertion=iwyu",
                            "--query-driver=/usr/bin/c++",
                        },
                        filetypes = { "c", "cpp", "hpp" }, -- Explicit filetypes for clangd
                        init_options = {
                            usePlaceholders = false,       -- Enable placeholders for completion
                            completion = {
                                snippets = "insert",       -- Allow insertion of snippets
                            },
                            clangdFileStatus = true,       -- Show file status (indexing progress)
                        },
                        settings = {
                            clangd = {
                                compileFlags = {
                                    add = {
                                        "-std=c++98",
                                        "-Wall",
                                        "-Wextra",
                                        "-Werror",
                                        "-Wshadow"
                                    },
                                },
                                completion = {
                                },
                            },
                        },
                    }
                else
                    lspconfig[lsp] = {
                        on_attach = on_attach,
                        on_init = on_init,
                        capabilities = capabilities,
                    }
                end
                vim.lsp.enable(lsp)
            end
        end,
    },
}
