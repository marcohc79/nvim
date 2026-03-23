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

-- <leader>ce → exportar PDF manualmente vía tinymist (útil si onSave no funciona)
vim.keymap.set("n", "<leader>ce", function()
  local bufnr = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients({ bufnr = bufnr, name = "tinymist" })
  if #clients == 0 then
    vim.notify("tinymist no está conectado a este buffer", vim.log.levels.WARN)
    return
  end
  clients[1].request("workspace/executeCommand", {
    command = "tinymist.exportPdf",
    arguments = { vim.uri_from_bufnr(bufnr) },
  }, function(err, result)
    if err then
      vim.notify("Error exportando PDF: " .. vim.inspect(err), vim.log.levels.ERROR)
    else
      vim.notify("PDF exportado: " .. vim.inspect(result), vim.log.levels.INFO)
    end
  end, bufnr)
end, { buffer = true, desc = "Typst: exportar PDF ahora" })
