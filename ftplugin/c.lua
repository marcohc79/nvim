vim.treesitter.start()
vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo[0][0].foldmethod = 'expr'
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

-- Linux kernel coding style: tabs de ancho 8
vim.bo.expandtab = false
vim.bo.tabstop = 8
vim.bo.shiftwidth = 8
vim.bo.softtabstop = 8
