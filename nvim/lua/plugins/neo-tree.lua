return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
        require("neo-tree").setup({
            -- ref: https://github.com/nvim-neo-tree/neo-tree.nvim?tab=readme-ov-file#quickstart
            enable_git_status = true,
            enable_diagnostics = true,
            filesystem = {
                -- working directory setting
                -- ref: https://github.com/nvim-neo-tree/neo-tree.nvim/blob/206241e451c12f78969ff5ae53af45616ffc9b72/doc/neo-tree.txt#L885
                use_libuv_file_watcher = true, -- Use `uv.fs_watch` for watching update of directories and files

                -- filtered_items: https://github.com/nvim-neo-tree/neo-tree.nvim/blob/206241e451c12f78969ff5ae53af45616ffc9b72/doc/neo-tree.txt#L914
                filtered_items = {
                    visible = true,
                    show_hidden_count = true,
                    hide_dotfiles = true,
                    hide_gitignored = false,
                    hide_by_name = {
                        ".git",
                        ".DS_Store",
                    }
                },
                follow_current_file = {
                    enabled = true,
                    -- working directory settings
                },
            },
            window = {
                position = "left",
                width = 30,
                auto_resize = false,
                -- mappings = {
                --     custom_only = false,
                --     list = {
                --         { key = { "l", "<CR>", "o" }, cb = "<CR>", mode = "n" },
                --         { key = "h", cb = "<C-W><C-H>", mode = "n" },
                --         { key = "l", cb = "<C-W><C-L>", mode = "n" },
                --         { key = "q", cb = "<cmd>NeotreeClose<CR>", mode = "n" },
                --     }
                -- }
                mapping_options = {
                    noremap = true,
                    nowait = true,
                },
                mappings = {
                    -- ["<space>"] = {
                    --     "toggle_node",
                    --     nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
                    -- },
                    -- ["<2-LeftMouse>"] = "open",
                    ["<cr>"] = "open",
                    ["<esc>"] = "cancel", -- close preview or floating neo-tree window
                    ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
                    -- Read `# Preview Mode` for more information
                    ["l"] = "focus_preview",
                    ["S"] = "open_split",
                    ["s"] = "open_vsplit",
                    -- ["S"] = "split_with_window_picker",
                    -- ["s"] = "vsplit_with_window_picker",
                    ["t"] = "open_tabnew",
                    -- ["<cr>"] = "open_drop",
                    -- ["t"] = "open_tab_drop",
                    ["w"] = "open_with_window_picker",
                    --["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
                    ["C"] = "close_node",
                    -- ['C'] = 'close_all_subnodes',
                    ["z"] = "close_all_nodes",
                    --["Z"] = "expand_all_nodes",
                    ["a"] = {
                        "add",
                        -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
                        -- some commands may take optional config options, see `:h neo-tree-mappings` for details
                        config = {
                            show_path = "none" -- "none", "relative", "absolute"
                        }
                    },
                    ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
                    ["d"] = "delete",
                    ["r"] = "rename",
                    ["y"] = "copy_to_clipboard",
                    ["x"] = "cut_to_clipboard",
                    ["p"] = "paste_from_clipboard",
                    ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
                    -- ["c"] = {
                    --  "copy",
                    --  config = {
                    --    show_path = "none" -- "none", "relative", "absolute"
                    --  }
                    --}
                    ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
                    ["q"] = "close_window",
                    ["R"] = "refresh",
                    ["?"] = "show_help",
                    ["<"] = "prev_source",
                    [">"] = "next_source",
                    ["i"] = "show_file_details",
                }
            },
        })

        -- 起動時にneo-treeを自動的に開く
        vim.api.nvim_create_autocmd("VimEnter", {
            callback = function()
                if vim.fn.argc() == 0 then
                    -- 引数なしで起動した場合、カレントディレクトリでneo-treeを開く
                    vim.cmd("Neotree toggle")
                else
                    local arg = vim.fn.argv(0)
                    if vim.fn.isdirectory(arg) ~= 0 then
                        -- ディレクトリが指定された場合、そのディレクトリでneo-treeを開く
                        vim.cmd("cd " .. arg)
                        vim.cmd("Neotree toggle")
                    else
                        -- ファイルが指定された場合、そのファイルのディレクトリでneo-treeを開く
                        local parent_dir = vim.fn.fnamemodify(arg, ":h")
                        vim.cmd("cd " .. parent_dir)
                        vim.cmd("Neotree toggle")
                        -- ファイルを開く
                        vim.cmd("edit " .. arg)
                    end
                end
            end
        })
    end,
}
