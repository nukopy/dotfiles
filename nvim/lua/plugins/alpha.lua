return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = {
      "                                                     ",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                     ",
    }

    -- Set menu
    dashboard.section.buttons.val = {
        -- dashboard.button("t", "  Neotree", ":Neotree toggle<Return>"),
        dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("r", "  Recent file", ":Telescope oldfiles <CR>"),
        dashboard.button("f", "󰥨  Find file", ":Telescope find_files <CR>"),
        dashboard.button("g", "󰱼  Find text", ":Telescope live_grep <CR>"),
        dashboard.button("s", "  Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
        dashboard.button("q", "  Quit", ":qa<CR>"),
    }


    -- Set footer
    local function footer()
      local total_plugins = #vim.tbl_keys(package.loaded)
      local datetime = os.date(" %Y-%m-%d   %H:%M:%S")
      local version = vim.version()
      local version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch
      return datetime .. "  ⚡" .. total_plugins .. " plugins" .. version_info
    end
    dashboard.section.footer.val = footer()

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])

    -- Display alpha UI on startup
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        if vim.fn.argc() == 0 and vim.fn.line2byte("$") == -1 then
          require("alpha").start()
        end
      end,
    })
  end
}
