-- conform.nvim: formateador asíncrono por tipo de archivo.
-- Instalar cada formateador con Mason (:MasonInstall <nombre>) o manualmente.
return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>cf",
      function() require("conform").format({ async = true, lsp_fallback = true }) end,
      mode = { "n", "v" },
      desc = "Format buffer / selection",
    },
  },
  opts = {
    formatters_by_ft = {
      python   = { "ruff_format" },        -- :MasonInstall ruff
      java     = { "google-java-format" },  -- :MasonInstall google-java-format
      c        = { "clang-format" },        -- sudo dnf install clang-tools-extra (incluye clang-format)
      cpp      = { "clang-format" },
      cmake    = { "gersemi" },             -- :MasonInstall gersemi
      tex      = { "latexindent" },         -- :MasonInstall latexindent
      latex    = { "latexindent" },
      markdown = { "mdformat" },            -- :MasonInstall mdformat
      rust     = { "rustfmt" },             -- rustup component add rustfmt
      typst    = { "typstyle" },            -- :MasonInstall typstyle
    },
    -- Formatear automáticamente al guardar (:w / Ctrl+S):
    format_on_save = {
      timeout_ms = 3000,
      lsp_fallback = true,
    },
    -- Usar --fallback-style=none para que clang-format NO aplique LLVM (2 espacios)
    -- si no encuentra .clang-format; así solo formatea cuando el archivo existe.
    formatters = {
      ["clang-format"] = {
        prepend_args = { "--fallback-style=none" },
      },
    },
  },
}
