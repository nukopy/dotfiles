-- encoding
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- general
vim.opt.title = true
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.scrolloff = 10

-- lines
vim.wo.number = true
vim.wo.wrap = false
vim.opt.cursorline = true
vim.opt.cursorline = true
-- tab
vim.opt.tabstop = 2      -- タブ文字がどれくらいの幅で表示されるか。あくまで見え方の設定であって、1 文字のタブ文字 \t として存在する。
vim.opt.expandtab = true -- tab キーを押した時にタブ文字の代わりに半角スペース x N を入力する
vim.opt.softtabstop = -1 -- tab キーを押した時に何文字分の半角スペースを入力するか。負の値（-1 など）を設定すると、tabstop で設定した値に合わせてくれる。
vim.opt.smarttab = true  -- 行頭の余白内で tab キーを押した時にインデントを自動検知して入力してくれる

-- indent
vim.opt.autoindent = true            -- 改行時に前の行のインデントを継続
vim.opt.smartindent = true           -- 改行時にインデントを自動で増減
vim.opt.shiftwidth = 4               -- 自動インデント幅
vim.cmd("filetype plugin indent on") -- ファイルタイプに基づくインデントを有効にする

-- clipboard
vim.opt.clipboard = "unnamed" -- yank や dd を実行した時の内容をシステムのクリップボードに反映する

-- backup
vim.opt.swapfile = false

-- cursol, keymap
vim.opt.backspace = "indent,eol,start" -- backspace 有効化
vim.opt.whichwrap = "b,s,h,l,<,>,[,]"  -- 行を跨いだキー操作（カーソル移動、削除など）を可能にする

-- color
vim.opt.termguicolors = true
