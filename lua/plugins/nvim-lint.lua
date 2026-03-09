-- nvim-lint: linters asíncronos por tipo de archivo.
-- Complementa los diagnósticos del LSP con reglas adicionales.
-- Instalar cada linter con Mason (:MasonInstall <nombre>) o manualmente.
return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufWritePost", "InsertLeave" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      python   = { "ruff" },              -- :MasonInstall ruff
      java     = { "checkstyle" },         -- :MasonInstall checkstyle
      c        = { "cpplint" },            -- :MasonInstall cpplint
      cpp      = { "cpplint" },
      cmake    = { "cmakelint" },          -- :MasonInstall cmakelint
      markdown = { "markdownlint-cli2" },  -- :MasonInstall markdownlint-cli2 (ya instalado)
      -- tex: chktex ya está integrado en texlab (LSP), no hace falta duplicar
      -- rust: clippy ya está integrado en rust-analyzer (LSP)
    }

    -- cpplint sigue el estilo de Google (espacios), pero con un .clang-format
    -- de tipo Linux kernel (estilo Linus Torvalds) el código usa tabuladores.
    -- Desactivamos los filtros que generan falsos positivos en ese estilo:
    --   whitespace/tab   → el kernel usa tabs a 8 espacios, no son errores
    --   legal/copyright  → ficheros de proyecto/kernel no llevan cabecera legal
    vim.list_extend(lint.linters.cpplint.args, {
      "--filter=-whitespace/tab,-legal/copyright",
    })

    -- Ejecutar linters al guardar y al salir de modo inserción
    vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave", "BufReadPost" }, {
      group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
      callback = function()
        -- Solo lintear si el buffer tiene un archivo asociado
        if vim.bo.buftype == "" then
          lint.try_lint()
        end
      end,
    })
  end,
}
