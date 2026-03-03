return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern", -- "classic" | "modern" | "helix"

    delay = function(ctx)
      return ctx.plugin and 0 or 200
    end,

    plugins = {
      marks = true,
      registers = true,
      spelling = { enabled = true, suggestions = 20 },
      presets = {
        operators = true,
        motions = true,
        text_objects = true,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    },

    notify = true, -- avisa si detecta problemas con mappings

    -- Triggers automáticos (lo normal)
    triggers = {
      { "<auto>", mode = "nxso" },
    },

  },

  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },

    { "<leader>b", group = "[b]uffer" },
    { "<leader>c", group = "[c]ode" },
    { "<leader>f", group = "[f]ind" },
    { "<leader>g", group = "[g]it" },
    { "<leader>h", group = "git [h]unk" },
    { "<leader>t", group = "[t]oggle/terminal" },
    { "<leader>a", group = "[a]i (Copilot)" },
    { "<leader>u", group = "[u]i" },
  },
}
