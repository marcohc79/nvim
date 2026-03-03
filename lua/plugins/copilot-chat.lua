return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    "zbirenbaum/copilot.lua",
    "nvim-lua/plenary.nvim",
  },
  build = "make tiktoken",
  cmd = {
    "CopilotChat",
    "CopilotChatOpen",
    "CopilotChatToggle",
    "CopilotChatModels",
    "CopilotChatAgents",
  },
  opts = {
    model = "gpt-4.1",
    agent = "copilot", -- Agente que soporta crear/editar/eliminar archivos
    sticky = { "#buffer" }, -- Incluir siempre el buffer activo como contexto
    -- Herramientas que el agente puede usar:
    --   file  – leer archivos
    --   edit  – aplicar diffs para crear/editar/eliminar archivos
    --   bash  – ejecutar comandos en terminal
    --   grep  – buscar patrones en archivos
    tools = "default", -- Habilita todas las herramientas (incluye "edit")
    -- Para que funcione:
    --   1. Abre Neovim en la raíz del proyecto (cd mi-proyecto && nvim).
    --   2. El directorio de trabajo (cwd) define el "workspace" al que
    --      el agente tiene acceso.
    --   3. Necesitas estar autenticado con  :Copilot auth
    --   4. Dentro del chat:
    --        <C-y>  aceptar el diff sugerido y aplicarlo al archivo
    --        gj     saltar a la ubicación del diff
    --        gy     copiar el diff al portapapeles
    --        gq     enviar todos los diffs al quickfix
  },
  keys = {
    -- Toggle chat window
    { "<leader>aa", "<cmd>CopilotChatToggle<CR>", desc = "Toggle Copilot Chat", mode = { "n", "v" } },
    -- Quick chat: ask about selection or current buffer
    {
      "<leader>aq",
      function()
        local input = vim.fn.input("Copilot Chat: ")
        if input ~= "" then
          require("CopilotChat").ask(input)
        end
      end,
      desc = "Quick Chat (ask anything)",
      mode = { "n", "v" },
    },
    -- Explain selected code
    {
      "<leader>ae",
      function() require("CopilotChat").ask("Explica este código en detalle.") end,
      desc = "Explain code",
      mode = { "n", "v" },
    },
    -- Review selected code
    {
      "<leader>ar",
      function() require("CopilotChat").ask("Revisa este código y sugiere mejoras.") end,
      desc = "Review code",
      mode = { "n", "v" },
    },
    -- Fix / refactor
    {
      "<leader>af",
      function() require("CopilotChat").ask("Corrige los errores en este código.") end,
      desc = "Fix code",
      mode = { "n", "v" },
    },
    -- Generate tests
    {
      "<leader>at",
      function() require("CopilotChat").ask("Genera tests unitarios para este código.") end,
      desc = "Generate tests",
      mode = { "n", "v" },
    },
    -- Select model
    { "<leader>am", "<cmd>CopilotChatModels<CR>", desc = "Select model" },
    -- Select agent
    { "<leader>aA", "<cmd>CopilotChatAgents<CR>", desc = "Select agent" },
    -- Reset chat
    {
      "<leader>ax",
      function() require("CopilotChat").reset() end,
      desc = "Reset chat",
    },
  },
}
