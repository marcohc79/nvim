-- typst-preview.nvim: previsualización en vivo de archivos Typst en el navegador.
-- Similar a markdown-preview.nvim pero para Typst.
-- Usa tinymist como backend (`:MasonInstall tinymist`).
-- Comandos: :TypstPreview  :TypstPreviewStop  :TypstPreviewToggle
return {
  "chomosuke/typst-preview.nvim",
  ft = { "typst" },
  version = "1.*",
  opts = {
    -- Sincroniza la posición del cursor entre el editor y la preview.
    follow_cursor = true,
  },
}
