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

    -- Grupos de <leader> con sus iconos (deben ir en spec, no en keys)
    spec = {
      { "<leader>b", group = "[b]uffer",          icon = "󰈙" },
      { "<leader>c", group = "[c]ode",            icon = "󰖲" },
      { "<leader>d", group = "[d]ebug",           icon = "󰃤" },
      { "<leader>f", group = "[f]ind",            icon = "󰍉" },
      { "<leader>g", group = "[g]it",             icon = "󰘬" },
      { "<leader>h", group = "git [h]unk",        icon = "󰊢" },
      { "<leader>t", group = "[t]oggle/terminal", icon = "󰆍" },
      { "<leader>a", group = "[a]i (Copilot)",    icon = "󰚩" },
      { "<leader>u", group = "[u]i",              icon = "󰓓" },
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
  },
}
