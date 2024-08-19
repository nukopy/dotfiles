return {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        -- デフォルト設定を使用
        padding = true,
        sticky = true,
        ignore = nil,
        toggler = {
            line = "g/",
            block = "gb",
        },
        opleader = {
            line = "gcc",
            block = "gbc",
        },
        extra = {
            above = "gcO",
            below = "gco",
            eol = "gcA",
        },
        mappings = {
            basic = true,
            extra = true,
        },
        pre_hook = nil,
        post_hook = nil,
    },
}
