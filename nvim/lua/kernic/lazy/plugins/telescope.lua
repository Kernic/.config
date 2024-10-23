local builtin = require("telescope.builtin")
return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
        {
            "<leader>pf",
            builtin.find_files,
            desc = "Telescope find files",
        },
        {
            "<leader>ps",
            function()
                builtin.grep_string({ vim.fn.input("Grep > ") })
            end,
            desc = "Telescope Grep",
        },
    },
}
