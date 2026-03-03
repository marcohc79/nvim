return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept = "<M-y>",          -- Acepta la sugerencia completa
        accept_word = "<M-w>",     -- Acepta solo la siguiente palabra
        accept_line = "<M-l>",     -- Acepta solo la línea actual
        next = "<M-]>",            -- Siguiente sugerencia
        prev = "<M-[>",            -- Sugerencia anterior
        dismiss = "<M-e>",         -- Descartar sugerencia
      },
    },
    panel = { enabled = false },
    filetypes = {
      ["*"] = true,
      help = false,
      gitrebase = false,
    },
  },
}
