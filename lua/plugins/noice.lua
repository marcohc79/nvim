return {
  -- lazy.nvim
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    lsp = {
      -- blink.cmp maneja hover y signature help; deshabilitamos los de noice
      -- para evitar que ambos compitan por el mismo evento LSP y corrompan
      -- el estado de los floating windows (causa principal del "autocomplete muerto").
      hover = { enabled = false },
      signature = { enabled = false },
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
      },
    },

    -- Filtros de mensajes: descartar notificaciones que no aportan valor pero
    -- pueden saturar la cola interna de noice y congelar los floating windows
    -- (blink.cmp y which-key dejan de responder cuando esto ocurre).
    routes = {
      -- Suprimir el spam de progreso del indexador de clangd ($/progress).
      -- Con --background-index activo, clangd envía decenas de "indexing…"
      -- por sesión; redirigirlos a /dev/null evita que noice se trabe.
      {
        filter = { event = "lsp", kind = "progress", find = "clangd" },
        opts   = { skip = true },
      },
    },

    presets = {
      bottom_search = false,
      command_palette = true,
      long_message_to_split = true,
      lsp_doc_border = true,
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
  }
}
