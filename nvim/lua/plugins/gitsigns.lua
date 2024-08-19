return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup({
            signs                        = {
                add          = { text = "┃" },
                change       = { text = "┃" },
                -- delete       = { text = "_" },
                delete       = { text = ">" },
                topdelete    = { text = ">" },
                changedelete = { text = "~" },
                untracked    = { text = "┆" },
            },
            signs_staged                 = {
                add          = { text = "┃" },
                change       = { text = "┃" },
                delete       = { text = "_" },
                topdelete    = { text = "‾" },
                changedelete = { text = "~" },
                untracked    = { text = "┆" },
            },
            signs_staged_enable          = true,
            signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
            numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
            linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
            watch_gitdir                 = {
                follow_files = true
            },
            auto_attach                  = true,
            attach_to_untracked          = false,
            current_line_blame           = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts      = {
                virt_text = true,
                virt_text_pos = "eol", -- "eol" | "overlay" | "right_align"
                delay = 1000,
                ignore_whitespace = false,
                virt_text_priority = 100,
            },
            current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
            sign_priority                = 6,
            update_debounce              = 100,
            status_formatter             = nil,   -- Use default
            max_file_length              = 40000, -- Disable if file is longer than this (in lines)
            preview_config               = {
                -- Options passed to nvim_open_win
                border = "single",
                style = "minimal",
                relative = "cursor",
                row = 0,
                col = 1
            },
        })

        ----------------------------------------------
        --- keymaps
        ----------------------------------------------

        -- toggle
        vim.api.nvim_set_keymap("n", "<Leader>gt", ":Gitsigns toggle_signs<CR>", { noremap = true, silent = true })

        ----------------------------------------------
        -- keymaps: view
        ----------------------------------------------

        -- diff
        vim.api.nvim_set_keymap("n", "<Leader>gd", ":Gitsigns diffthis<CR>", { noremap = true, silent = true })

        -- blame
        vim.api.nvim_set_keymap("n", "<Leader>gb", ":Gitsigns toggle_current_line_blame<CR>",
            { noremap = true, silent = true })

        -- preview
        vim.api.nvim_set_keymap("n", "<Leader>gp", ":Gitsigns preview_hunk<CR>", { noremap = true, silent = true })

        -- move to next/prev hunk
        vim.api.nvim_set_keymap("n", "<Leader>gn", ":Gitsigns next_hunk<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<Leader>gp", ":Gitsigns prev_hunk<CR>", { noremap = true, silent = true })

        ----------------------------------------------
        -- manipulation
        ----------------------------------------------

        -- staging
        -- stage hunk (hunk: 前回コミットから変更されたファイルの一部分)
        vim.api.nvim_set_keymap("n", "<Leader>ga", ":Gitsigns stage_hunk<CR>", { noremap = true, silent = true })
        -- stage selected hunk
        vim.api.nvim_set_keymap("x", "<Leader>gs",
            ":<C-U>lua require('gitsigns').stage_hunk({vim.fn.line('.'), vim.fn.line('v')})<CR>",
            { noremap = true, silent = true })
        -- stage buffer（buffer: ファイル全体）
        vim.api.nvim_set_keymap("n", "<Leader>gA", ":Gitsigns stage_buffer<CR>", { noremap = true, silent = true })

        -- unstaging
        -- undo staged hunk: ステージングされた hunk を取り消す
        vim.api.nvim_set_keymap("n", "<Leader>gu", ":Gitsigns undo_stage_hunk<CR>", { noremap = true, silent = true })
        -- undo staged buffer: ステージングされた buffer を取り消す
        vim.api.nvim_set_keymap("n", "<Leader>gU", ":Gitsigns reset_buffer_index<CR>", { noremap = true, silent = true })

        -- reset
        -- reset hunk: hunk を取り消す。ステージングされていない変更に対して作用し、現在の変更（= hunk。変更の一部。）を取り消す。
        vim.api.nvim_set_keymap("n", "<Leader>gr", ":Gitsigns reset_hunk<CR>", { noremap = true, silent = true })
        -- reset buffer: ファイル全体の変更を取り消す。ステージングされていない変更に対して作用し、現在の変更（= ファイル全体）を取り消す。
        vim.api.nvim_set_keymap("n", "<Leader>gR", ":Gitsigns reset_buffer<CR>", { noremap = true, silent = true })
    end
}
