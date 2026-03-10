return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = false,
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
  keys = {
    {
      "<leader>aT",
      function()
        local suggestion = require("copilot.suggestion")
        local current = vim.b.copilot_suggestion_auto_trigger or false
        suggestion.toggle_auto_trigger()
        vim.notify("Copilot auto-trigger: " .. (not current and "ON" or "OFF"), vim.log.levels.INFO)
      end,
      desc = "Toggle Copilot auto-trigger",
    },
  },
}
