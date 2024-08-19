local keymap = vim.keymap

-- esc alias
-- keymap.set("i", "<C-j>", "<esc>")
-- keymap.set("v", "<C-j>", "<esc>")

-- window manipulation
keymap.set("n", "g]", ":vsplit<Return><C-w>w")
keymap.set("n", "g[", ":split<Return><C-w>w")
keymap.set("n", "gh", "<C-w>h")
keymap.set("n", "gj", "<C-w>j")
keymap.set("n", "gk", "<C-w>k")
keymap.set("n", "gl", "<C-w>l")
keymap.set("n", "rh", "<C-w><")
keymap.set("n", "rj", "<C-w>-")
keymap.set("n", "rk", "<C-w>+")
keymap.set("n", "rl", "<C-w>>")

-- vim のキーバインドに慣れるため、一部 Emacs のキーバインドを無効にする
-- keymap.set("n", "<C-e>", "<End>")
-- keymap.set("n", "<C-a>", "<Home>")
keymap.set("n", "<C-e>", "<Nop>", { noremap = true, silent = true })
keymap.set("n", "<C-a>", "<Nop>", { noremap = true, silent = true })
keymap.set("n", "<C-p>", "<Nop>", { noremap = true, silent = true })
keymap.set("n", "<C-n>", "<Nop>", { noremap = true, silent = true })

-- cursor move keymaps with emacs keybinds
keymap.set("i", "<C-p>", "<Up>")
keymap.set("i", "<C-n>", "<Down>")
keymap.set("i", "<C-b>", "<Left>")
keymap.set("i", "<C-f>", "<Right>")
        keymap.set("i", "<C-a>", "<C-o>^")
-- keymap.set("n", "<C-a>", "<C-o>^") 邪道
-- keymap.set("v", "<C-a>", "<C-o>^") 邪道
keymap.set("i", "<C-e>", "<End>")
-- keymap.set("n", "<C-e>", "<End>") 邪道
-- keymap.set("v", "<C-e>", "<End>") 邪道
keymap.set("i", "<C-h>", "<BS>")
keymap.set("i", "<C-k>", "<C-o>D")
keymap.set("i", "<C-y>", "<C-o>p")
keymap.set("i", "<C-d>", "<Del>")
-- keymap.set("n", "<C-/>", ":CommentToggle<CR>")
-- keymap.set("i", "<C-[>", "<C-d>")  -- Decrease indent
-- keymap.set("i", "<C-]>", "<C-t>")  -- Increase indent

-- keymap.set("v", "<C-e>", "<End>")
-- keymap.set("v", "<C-a>", "<Home>")

-- neotree window <->  window
keymap.set("n", "<leader>t", function()
    if vim.bo.filetype == "neo-tree" then
        vim.cmd("wincmd p")
    else
        vim.cmd("Neotree focus")
    end
end, { noremap = true, silent = true, desc = "Toggle focus between Neotree and last active window" })

-- reload settings
keymap.set("n", "<Leader>rs", ":luafile ~/.config/nvim/init.lua<CR>", { noremap = true, silent = true })

-- turn off mouse
vim.opt.mouse = ""

-- turn off mouse: scroll
-- -- スクロールホイールを無効化
-- vim.keymap.set("n", "<ScrollWheelUp>", "<Nop>", { silent = true })
-- vim.keymap.set("n", "<ScrollWheelDown>", "<Nop>", { silent = true })
-- vim.keymap.set("i", "<ScrollWheelUp>", "<Nop>", { silent = true })
-- vim.keymap.set("i", "<ScrollWheelDown>", "<Nop>", { silent = true })
-- vim.keymap.set("v", "<ScrollWheelUp>", "<Nop>", { silent = true })
-- vim.keymap.set("v", "<ScrollWheelDown>", "<Nop>", { silent = true })
--
-- -- 水平スクロールも無効化（必要な場合）
-- vim.keymap.set("n", "<ScrollWheelLeft>", "<Nop>", { silent = true })
-- vim.keymap.set("n", "<ScrollWheelRight>", "<Nop>", { silent = true })
-- vim.keymap.set("i", "<ScrollWheelLeft>", "<Nop>", { silent = true })
-- vim.keymap.set("i", "<ScrollWheelRight>", "<Nop>", { silent = true })
-- vim.keymap.set("v", "<ScrollWheelLeft>", "<Nop>", { silent = true })
-- vim.keymap.set("v", "<ScrollWheelRight>", "<Nop>", { silent = true })

--[[ -- スクロールイベントのリスト
local scroll_events = {
  "ScrollWheelUp",
  "ScrollWheelDown",
  "ScrollWheelLeft",
  "ScrollWheelRight",
  "2-ScrollWheelUp",
  "2-ScrollWheelDown",
  "2-ScrollWheelLeft",
  "2-ScrollWheelRight",
  "3-ScrollWheelUp",
  "3-ScrollWheelDown",
  "3-ScrollWheelLeft",
  "3-ScrollWheelRight",
  "4-ScrollWheelUp",
  "4-ScrollWheelDown",
  "4-ScrollWheelLeft",
  "4-ScrollWheelRight"
}

-- 各モードに対してスクロールを無効化
local modes = {"i", "n", "v"}

for _, mode in ipairs(modes) do
  for _, event in ipairs(scroll_events) do
    vim.keymap.set(mode, "<" .. event .. ">", "<nop>", { noremap = true, silent = true })
  end
end

-- mousetime オプションを短く設定
vim.opt.mousetime = 1

-- モード別のカスタム動作（例）
-- insert モードでは上スクロールで1行上に移動
keymap.set("i", "<ScrollWheelUp>", "<C-O>k", { noremap = true, silent = true })
-- normal モードでは下スクロールでハーフページ下に移動
keymap.set("n", "<ScrollWheelDown>", "<C-D>", { noremap = true, silent = true })
-- visual モードでは左スクロールで選択範囲を左に拡大
keymap.set("v", "<ScrollWheelLeft>", "<Left>", { noremap = true, silent = true }) ]]

--------------------------------------------------------------------------------
-- terminal
--------------------------------------------------------------------------------

-- terminal mode から抜ける
keymap.set("t", "<Esc>", "<C-\\><C-N>") -- <Esc> でノーマルモードに戻る

-- normal mode, insert mode から直接ターミナルを開く
keymap.set("n", "<C-;>", ":terminal<CR>", { noremap = true, silent = true })
keymap.set("i", "<C-;>", ":terminal<CR>", { noremap = true, silent = true })
