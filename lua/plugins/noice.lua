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
