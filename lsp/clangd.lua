-- clangd: C, C++ (también objc, cuda)
-- Instalar: sudo dnf install clang-tools-extra
return {
  cmd = {
    "clangd",
    "--background-index",
    -- Prioridad baja para el indexador: evita que sature la CPU y genere un
    -- aluvión de notificaciones $/progress que pueden trabar noice.nvim.
    "--background-index-priority=low",
    -- IWYU (Include What You Use) analiza dependencias de cabeceras de forma
    -- agresiva y puede bloquear el servidor; "never" es más estable.
    "--header-insertion=never",
    "--completion-style=detailed",
    "--function-arg-placeholders",
    "--fallback-style=none",
    -- clang-tidy eliminado: ejecuta análisis pesados en background que provocan
    -- que clangd se cuelgue o crashee, dejando sin autocompletado ni menú <leader>.
  },

  -- Si clangd muere de forma inesperada, reiniciarlo automáticamente en todos
  -- los buffers C/C++ abiertos para que el autocompletado vuelva solo.
  on_exit = function(code, _signal, _client_id)
    if code ~= 0 then
      vim.schedule(function()
        for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
          if vim.api.nvim_buf_is_loaded(bufnr) then
            local ft = vim.bo[bufnr].filetype
            if vim.tbl_contains({ "c", "cpp", "objc", "cuda" }, ft) then
              vim.api.nvim_exec_autocmds("FileType", { pattern = ft, buf = bufnr })
            end
          end
        end
      end)
    end
  end,
}
