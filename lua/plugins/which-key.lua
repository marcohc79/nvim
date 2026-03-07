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

    -- Definición de grupos con iconos (leídos por which-key, no por lazy)
    spec = {
      { "<leader>a", group = "[a]i (Copilot)",    icon = { icon = "󰚩", color = "purple" } },
      { "<leader>b", group = "[b]uffer",          icon = { icon = "󰓩", color = "cyan"   } },
      { "<leader>c", group = "[c]ode",            icon = { icon = "󰅱", color = "orange" } },
      { "<leader>d", group = "[d]ebug (DAP)",     icon = { icon = "󰃤", color = "red"    } },
      { "<leader>f", group = "[f]ind",            icon = { icon = "󰍉", color = "blue"   } },
      { "<leader>g", group = "[g]it",             icon = { icon = "󰊢", color = "orange" } },
      { "<leader>h", group = "git [h]unk",        icon = { icon = "󱓊", color = "red"    } },
      { "<leader>t", group = "[t]oggle/terminal", icon = { icon = "󰆍", color = "green"  } },
      { "<leader>u", group = "[u]i",              icon = { icon = "󰙵", color = "yellow" } },
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
