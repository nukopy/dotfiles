vim.lsp.start({
    name = "lua_ls",
    cmd = ("lua-language-server"),
    root_dir = vim.fs.dirname(vim.fs.find({ ".luarc.json" }, { upward = true })[1]),
})

