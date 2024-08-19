return {
    "phaazon/hop.nvim",
    branch = "v2", -- optional but strongly recommended
    config = function()
        -- you can configure Hop the way you like here; see :h hop-config
        require("hop").setup({
            multi_windows = true,
            keys = "abcdefghijklmnopqrstuvwxyz"
        })
    end,
    keys = {
        {
            mode = "",
            "<Leader>hw",
            ":HopWord<CR>",
            desc = "Hop Word",
        },
        {
            mode = "",
            "<Leader>hl",
            ":HopLine<CR>",
            desc = "Hop Line",
        },
        -- {
        --     mode = "",
        --     "<Leader>hc",
        --     ":HopChar1<CR>",
        --     desc = "Hop Char 1",
        -- },
        {
            mode = "",
            "<Leader>hc",
            ":HopChar2<CR>",
            desc = "Hop Char 2",
        },
        {
            mode = "",
            "<Leader>hp",
            ":HopPattern<CR>",
            desc = "Hop Pattern",
        },
    }
}
