return {
    "nvim-treesitter/nvim-treesitter",
    bulid = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup(
            {
                ensure_installed = {
                    "c",
                    "lua",
                    "vim",
                    "vimdoc",
                    "python",
                    "rust",
                    "html",
                    "javascript",
                    "query",
                    "java",
                    "regex",
                    "toml",
                    "xml",
                    "json",
                },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            }
        )
    end
}
