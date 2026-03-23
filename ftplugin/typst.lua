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

-- <leader>ce → exportar PDF ahora (guarda primero; LSP o CLI como fallback)
vim.keymap.set("n", "<leader>ce", function()
  local bufnr = vim.api.nvim_get_current_buf()
  local filepath = vim.api.nvim_buf_get_name(bufnr)
  if filepath == "" then
    vim.notify("Guarda el archivo antes de exportar (:w nombre.typ)", vim.log.levels.ERROR)
    return
  end

  -- Guardar SIEMPRE primero: tinymist compila desde el disco, no desde el buffer
  vim.cmd("write")

  -- Fallback: compilar con typst CLI si tinymist no está disponible o falla
  local function compile_with_cli()
    local out = vim.fn.system({ "typst", "compile", filepath })
    if vim.v.shell_error ~= 0 then
      vim.notify("typst compile error:\n" .. out, vim.log.levels.ERROR)
    else
      vim.notify("PDF generado: " .. vim.fn.fnamemodify(filepath, ":r") .. ".pdf",
        vim.log.levels.INFO)
    end
  end

  local clients = vim.lsp.get_clients({ bufnr = bufnr, name = "tinymist" })
  if #clients == 0 then
    vim.notify("tinymist no conectado, usando typst CLI...", vim.log.levels.WARN)
    compile_with_cli()
    return
  end

  -- Esperar que tinymist termine de compilar el archivo recién guardado.
  -- tinymist detecta el cambio en disco vía didSave y recompila de forma
  -- asíncrona; 400 ms es suficiente en la mayoría de máquinas, pero si
  -- obtienes "document not available" aumenta este valor.
  local TINYMIST_COMPILE_DELAY_MS = 400
  vim.defer_fn(function()
    clients[1].request("workspace/executeCommand", {
      command = "tinymist.exportPdf",
      arguments = { vim.uri_from_bufnr(bufnr) },
    }, function(err, result)
      if err then
        -- LSP falló: intentar con CLI
        compile_with_cli()
      else
        vim.notify("PDF exportado: " .. vim.inspect(result), vim.log.levels.INFO)
      end
    end, bufnr)
  end, TINYMIST_COMPILE_DELAY_MS)
end, { buffer = true, desc = "Typst: exportar PDF ahora" })
