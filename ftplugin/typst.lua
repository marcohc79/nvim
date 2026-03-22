vim.treesitter.start()
vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo[0][0].foldmethod = 'expr'
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

-- Atajos locales de Typst
-- <leader>cp → abrir/cerrar previsualización en el navegador (typst-preview.nvim)
vim.keymap.set("n", "<leader>cp", "<cmd>TypstPreviewToggle<cr>",
  { buffer = true, desc = "Typst: toggle preview" })

-- <leader>co → abrir el PDF generado en el visor del sistema
vim.keymap.set("n", "<leader>co", function()
  vim.ui.open(vim.fn.expand("%:r") .. ".pdf")
end, { buffer = true, desc = "Typst: abrir PDF" })
