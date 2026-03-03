-- nvim-dap: Debug Adapter Protocol para depuración integrada.
-- Cada adaptador se instala con Mason o manualmente.
return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      -- UI para depuración (paneles de variables, breakpoints, consola)
      {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
        config = function()
          local dapui = require("dapui")
          dapui.setup()
          -- Abrir/cerrar la UI automáticamente al iniciar/detener sesiones DAP
          local dap = require("dap")
          dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
          dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
          dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
        end,
      },
      -- Indicadores visuales de breakpoints en la columna de signos
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
      },
    },
    config = function()
      local dap = require("dap")

      -- ── Python (debugpy) ──────────────────────────────────────
      -- :MasonInstall debugpy
      dap.adapters.python = {
        type = "executable",
        command = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python",
        args = { "-m", "debugpy.adapter" },
      }
      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          pythonPath = function()
            -- Usa el venv activo si existe, sino python3 del sistema
            local venv = os.getenv("VIRTUAL_ENV")
            if venv then return venv .. "/bin/python" end
            return vim.fn.exepath("python3") or "python3"
          end,
        },
      }

      -- ── C / Rust (codelldb) ───────────────────────────────────
      -- :MasonInstall codelldb
      local codelldb_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb/codelldb"
      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = codelldb_path,
          args = { "--port", "${port}" },
        },
      }
      dap.configurations.c = {
        {
          name = "Launch (codelldb)",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }
      dap.configurations.cpp = dap.configurations.c
      dap.configurations.rust = {
        {
          name = "Launch (codelldb)",
          type = "codelldb",
          request = "launch",
          program = function()
            -- Buscar en target/debug/ por defecto
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }

      -- ── Java (java-debug-adapter) ────────────────────────────
      -- :MasonInstall java-debug-adapter java-test
      -- NOTA: jdtls integra el DAP automáticamente cuando java-debug-adapter
      -- está instalado. No se necesita configuración manual aquí.
      -- Se accede con :JdtDap o las keymaps de DAP.

      -- Signos de breakpoints en la columna de signos
      vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
      vim.fn.sign_define("DapBreakpointCondition", { text = "◐", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
      vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DapStopped", linehl = "DapStoppedLine", numhl = "" })
    end,
    -- stylua: ignore
    keys = {
      { "<leader>db", function() require("dap").toggle_breakpoint() end,          desc = "DAP: Toggle breakpoint" },
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, desc = "DAP: Conditional breakpoint" },
      { "<leader>dc", function() require("dap").continue() end,                   desc = "DAP: Continue" },
      { "<leader>di", function() require("dap").step_into() end,                  desc = "DAP: Step into" },
      { "<leader>do", function() require("dap").step_over() end,                  desc = "DAP: Step over" },
      { "<leader>dO", function() require("dap").step_out() end,                   desc = "DAP: Step out" },
      { "<leader>dr", function() require("dap").repl.toggle() end,                desc = "DAP: Toggle REPL" },
      { "<leader>dl", function() require("dap").run_last() end,                   desc = "DAP: Run last" },
      { "<leader>dt", function() require("dap").terminate() end,                  desc = "DAP: Terminate" },
      { "<leader>du", function() require("dapui").toggle() end,                   desc = "DAP: Toggle UI" },
    },
  },
}
