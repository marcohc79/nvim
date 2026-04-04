-- clangd: C, C++ (también objc, cuda)
-- Instalar: sudo dnf install clang-tools-extra
--
-- Configuración IDE completa equivalente a CLion.
-- La inestabilidad histórica (autocomplete muerto, menú <leader> sin respuesta)
-- NO venía de estas flags sino de noice.nvim saturándose con las notificaciones
-- $/progress que clangd genera durante el indexado. Eso se resuelve en
-- lua/plugins/noice.lua con un route filter; aquí mantenemos funcionalidad plena.
return {
  cmd = {
    "clangd",

    -- ── Indexado ──────────────────────────────────────────────────────────
    -- Construye un índice persistente en .cache/clangd/index para que el
    -- autocompletado, go-to-definition y find-references funcionen en todo
    -- el proyecto, no sólo en el archivo abierto (igual que el índice de CLion).
    "--background-index",
    -- El indexador corre en hilos de baja prioridad para no bloquear el hilo
    -- principal del LSP; no reduce calidad, sólo la planificación del SO.
    "--background-index-priority=low",

    -- ── Diagnósticos / análisis estático ──────────────────────────────────
    -- Activa clang-tidy integrado: detecta bugs, mal uso de la API, cabeceras
    -- faltantes, etc. Es la funcionalidad clave que da la experiencia CLion.
    "--clang-tidy",
    -- Los checks se leen del fichero .clang-tidy en la raíz del proyecto,
    -- igual que hace CLion. Si no existe, clangd usa los checks por defecto.
    -- Crea un .clang-tidy en cada proyecto para personalizar las inspecciones
    -- sin necesidad de tocar este fichero de configuración global.

    -- ── Cabeceras / includes ───────────────────────────────────────────────
    -- IWYU (Include What You Use): sugiere e inserta automáticamente las
    -- cabeceras necesarias, elimina las superfluas. Mismo comportamiento que
    -- "Optimize Imports" de CLion.
    "--header-insertion=iwyu",
    -- Muestra decoraciones (#include "foo.h") en el popup de completado para
    -- que sepas qué cabecera se va a insertar antes de aceptar.
    "--header-insertion-decorators",

    -- ── Completado ────────────────────────────────────────────────────────
    -- "detailed" incluye firma completa, tipo de retorno e info de parámetros
    -- directamente en el popup, sin tener que abrir la documentación aparte.
    "--completion-style=detailed",
    -- Ofrece completado desde todos los ámbitos del proyecto (namespaces,
    -- archivos no incluidos aún), igual que el completado global de CLion.
    "--all-scopes-completion",
    -- Inserta placeholders para los argumentos de una función al aceptar su
    -- completado, permitiendo navegar entre ellos con Tab.
    "--function-arg-placeholders",

    -- ── Rendimiento ───────────────────────────────────────────────────────
    -- Guarda las cabeceras precompiladas en RAM en lugar de en disco.
    -- Con hardware potente esto acelera notablemente el primer completado.
    "--pch-storage=memory",

    -- ── Renombrado ────────────────────────────────────────────────────────
    -- Permite renombrar un símbolo en todos los archivos del proyecto a la vez
    -- (equivalente al refactor Rename de CLion).
    "--cross-file-rename",

    -- ── Estilo ────────────────────────────────────────────────────────────
    -- "none" deja que clang-format o el .clang-format del proyecto manden;
    -- clangd no impone ningún estilo propio.
    "--fallback-style=none",
  },

  -- Si clangd termina de forma inesperada (señal, OOM, etc.) se relanza
  -- automáticamente en todos los buffers C/C++ abiertos para que el
  -- autocompletado vuelva solo, sin necesidad de :LspRestart manual.
  -- El guard evita adjuntar un segundo cliente si uno ya está activo
  -- (p.ej. si el SO relanzó clangd antes de que llegase este callback).
  on_exit = function(code, _signal, _client_id)
    if code ~= 0 then
      vim.schedule(function()
        for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
          if vim.api.nvim_buf_is_loaded(bufnr) then
            local ft = vim.bo[bufnr].filetype
            if vim.tbl_contains({ "c", "cpp", "objc", "cuda" }, ft) then
              local already = vim.lsp.get_clients({ bufnr = bufnr, name = "clangd" })
              if #already == 0 then
                vim.api.nvim_exec_autocmds("FileType", { pattern = ft, buf = bufnr })
              end
            end
          end
        end
      end)
    end
  end,
}
