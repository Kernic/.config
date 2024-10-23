return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v4.x",
    dependencies = {
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        local cmp = require('cmp')
        cmp.setup({
            source = {
                { name = "nvim-lsp" },
            },
            mapping = cmp.mapping.preset.insert(
                {
                    ['<C-y>'] = cmp.mapping.confirm({select = true}),
                    ['<C-Space>'] = cmp.mapping.complete(),
                }
            ),
            snippet = {
                expand = function(args)
                    vim.snippet.expand(args.body)
                end,
            },
        })

        -- Config LSP Zero
        local lsp = require ('lsp-zero')
        local on_attach = function(client, bufnr)
            local opts = { buffer = bufnr, remap = false }

            vim.keymap.set('n', "gd", function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set('n', "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set('n', "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
            vim.keymap.set('n', "<leader>vd", function() vim.diagnostic.open_float() end, opts)
            vim.keymap.set('n', "[d", function() vim.diagnostic.goto_next() end, opts)
            vim.keymap.set('n', "]d", function() vim.diagnostic.goto_prev() end, opts)
            vim.keymap.set('n', "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set('n', "<leader>vrr", function() vim.lsp.buf.references() end, opts)
            vim.keymap.set('n', "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
            vim.keymap.set('i', "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        end
        lsp.extend_lspconfig(
            {
                sign_text = ture,
                lsp_attach = on_attach,
                capabilities = require('cmp_nvim_lsp').default_capabilities()
            }
        )
        require('mason-lspconfig').setup(
            {
                ensure_installed = {
                    "lua_ls",
                    "pylyzer",
                    "rust_analyzer",
                },
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,
                }
            }
        )
    end,
}
