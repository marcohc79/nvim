vim.treesitter.start()
vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo[0][0].foldmethod = 'expr'
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

-- Atajos locales de Typst
-- <leader>cp → abrir/cerrar previsualización en el navegador (typst-preview.nvim)
vim.keymap.set("n", "<leader>cp", "<cmd>TypstPreviewToggle<cr>",
  { buffer = true, desc = "Typst: toggle preview" })
