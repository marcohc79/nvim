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
      -- Suprimir las notificaciones $/progress de TODOS los servidores LSP.
      -- Clangd (indexado), ltex_plus (análisis de gramática) y copilot generan
      -- decenas de mensajes de progreso por sesión; saturan la cola interna de
      -- noice y corrompen los floating windows de blink.cmp y which-key.
      -- Antes solo se filtraba clangd; ltex_plus y copilot también contribuyen.
      {
        filter = { event = "lsp", kind = "progress" },
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
