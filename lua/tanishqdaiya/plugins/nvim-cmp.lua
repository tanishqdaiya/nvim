return {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
                "hrsh7th/cmp-buffer", -- To use currently opened buffer as source.
                "hrsh7th/cmp-path", -- To use filesystem paths as source.
                "L3MON4D3/LuaSnip", -- Snippet Engine.
                "saadparwaiz1/cmp_luasnip", -- For autocompletion.
                "rafamadriz/friendly-snippets", -- Snippet Library.
        },
        config = function()
                local cmp = require("cmp")
                local luasnip = require("luasnip")

                require("luasnip.loaders.from_vscode").lazy_load()
                cmp.setup({
                        completion = {
                                completeopt = "menu,menuone,preview,noselect",
                        },
                        snippet = { -- Configuring nvim-cmp to interact with LuaSnip.
                                expand = function(args)
                                        luasnip.lsp_expand(args.body)
                                end
                        },
                        mapping = cmp.mapping.preset.insert({ -- Custom mappings.
                                ["<C-k>"] = cmp.mapping.select_prev_item(),
                                ["<C-j>"] = cmp.mapping.select_next_item(),
                                ["<C-p>"] = cmp.mapping.scroll_docs(-4),
                                ["<C-n>"] = cmp.mapping.scroll_docs(4),
                                ["<C-Space>"] = cmp.mapping.complete(), -- Show suggestions
                                ["<C-e>"] = cmp.mapping.abort(), -- To close the completion window
                                ["<CR>"] = cmp.mapping.confirm({ select = false }),
                        }),
                        sources = cmp.config.sources({ -- Autocompletion sources
                                { name = "nvim_lsp" },
                                { name = "luasnip" }, 
                                { name = "buffer" }, 
                                { name = "path" }, 
                        }),
                })
        end
}
