return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,

  opts = function()
    local Snacks = require("snacks")

    return {
      bigfile = { enabled = true },
      bufdelete = { enabled = true },
      explorer = { enabled = true },
      image = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      notify = { enabled = true },
      quickfile = { enabled = true },
      picker = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      toggle = { enabled = true },
      words = { enabled = true },

      indent = {
        enabled = true,

        indent = {
          char = "┆",
          only_current = true,
          priority = 1,
        },

        scope = {
          enabled = true,
          char = "┃",
          only_current = true,
          priority = 200,
        },

        animate = {
          enabled = true,
          style = "up_down",
          easing = "outCubic",
          duration = { step = 6, total = 140 },
        },

        chunk = {
          enabled = true,
          only_current = true,
          priority = 210,
          char = {
            corner_top = "╭",
            corner_bottom = "╰",
            horizontal = "─",
            vertical = "│",
            arrow = ">",
          },
        },

        -- evita que se active donde queda feo o no sirve
        filter = function(buf, win)
          if vim.bo[buf].buftype ~= "" then
            return false
          end
          local ft = vim.bo[buf].filetype
          return not vim.tbl_contains({
            "help",
            "dashboard",
            "snacks_dashboard",
            "snacks_picker",
            "snacks_input",
            "gitcommit",
            "TelescopePrompt",
          }, ft)
        end,
      },

      animate = {
        enabled = true,
        duration = 12,
        fps = 144,
        easing = "outCubic",
      },


      dashboard = {
        enabled = true,
        preset = {
          keys = {
            { icon = " ", key = "f", desc = "Find File",    action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File",     action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text",    action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "c", desc = "Config",       action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
            { icon = "󰒲 ", key = "L", desc = "Lazy",         action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit",         action = ":qa" },
          },
        },
        sections = {
          { section = "header" },
          {
            pane = 2,
            section = "terminal",
            cmd = "colorscript -e square",
            height = 5,
            padding = 1,
          },
          { section = "keys", gap = 1, padding = 1 },
          { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          {
            pane = 2,
            icon = " ",
            title = "Git Status",
            section = "terminal",
            enabled = function()
              return Snacks.git.get_root() ~= nil
            end,
            cmd = "git status --short --branch --renames",
            height = 5,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
          },
          { section = "startup" },
        },
      },

      gh = {
        keys = {
          select  = { "<cr>", "gh_actions", desc = "Select Action" },
          edit    = { "i",    "gh_edit",    desc = "Edit" },
          comment = { "a",    "gh_comment", desc = "Add Comment" },
          close   = { "c",    "gh_close",   desc = "Close" },
          reopen  = { "o",    "gh_reopen",  desc = "Reopen" },
        },

        wo = {
          breakindent = true,
          wrap = true,
          showbreak = "",
          linebreak = true,
          number = false,
          relativenumber = false,
          foldexpr = "v:lua.vim.treesitter.foldexpr()",
          foldmethod = "expr",
          concealcursor = "n",
          conceallevel = 2,
          list = false,

          winhighlight = Snacks.util.winhl({
            Normal = "SnacksGhNormal",
            NormalFloat = "SnacksGhNormalFloat",
            FloatBorder = "SnacksGhBorder",
            FloatTitle = "SnacksGhTitle",
            FloatFooter = "SnacksGhFooter",
          }),
        },

        bo = {},

        diff = {
          min = 4,
          wrap = 80,
        },

        scratch = {
          height = 15,
        },

        icons = {
          logo = " ",
          user = " ",
          checkmark = " ",
          crossmark = " ",
          block = "■",
          file = " ",
          checks = {
            pending = " ",
            success = " ",
            failure = "",
            skipped = " ",
          },
          issue = {
            open      = " ",
            completed = " ",
            other     = " ",
          },
          pr = {
            open   = " ",
            closed = " ",
            merged = " ",
            draft  = " ",
            other  = " ",
          },
          review = {
            approved          = " ",
            changes_requested = " ",
            commented         = " ",
            dismissed         = " ",
            pending           = " ",
          },
          merge_status = {
            clean    = " ",
            dirty    = " ",
            blocked  = " ",
            unstable = " ",
          },
          reactions = {
            thumbs_up   = "👍",
            thumbs_down = "👎",
            eyes        = "👀",
            confused    = "😕",
            heart       = "❤️",
            hooray      = "🎉",
            laugh       = "😄",
            rocket      = "🚀",
          },
        },
      },
      terminal = {
        enabled = true,
        win = { style = "terminal" },
      },
    }
  end,

  keys = {
    -- Top Pickers & Explorer
    { "<leader><space>", function() require("snacks").picker.smart() end, desc = "Smart Find Files" },
    { "<leader>,", function() require("snacks").picker.buffers() end, desc = "Buffers" },
    { "<leader>/", function() require("snacks").picker.grep() end, desc = "Grep" },
    { "<leader>:", function() require("snacks").picker.command_history() end, desc = "Command History" },
    { "<leader>n", function() require("snacks").picker.notifications() end, desc = "Notification History" },
    { "<leader>e", function() require("snacks").explorer() end, desc = "File Explorer" },

    -- find
    { "<leader>fb", function() require("snacks").picker.buffers() end, desc = "Buffers" },
    { "<leader>fc", function() require("snacks").picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    { "<leader>ff", function() require("snacks").picker.files() end, desc = "Find Files" },
    { "<leader>fg", function() require("snacks").picker.git_files() end, desc = "Find Git Files" },
    { "<leader>fp", function() require("snacks").picker.projects() end, desc = "Projects" },
    { "<leader>fr", function() require("snacks").picker.recent() end, desc = "Recent" },

    -- git
    { "<leader>gb", function() require("snacks").picker.git_branches() end, desc = "Git Branches" },
    { "<leader>gl", function() require("snacks").picker.git_log() end, desc = "Git Log" },
    { "<leader>gL", function() require("snacks").picker.git_log_line() end, desc = "Git Log Line" },
    { "<leader>gs", function() require("snacks").picker.git_status() end, desc = "Git Status" },
    { "<leader>gS", function() require("snacks").picker.git_stash() end, desc = "Git Stash" },
    { "<leader>gf", function() require("snacks").picker.git_log_file() end, desc = "Git Log File" },
    { "<leader>gg", function() require("snacks").lazygit() end, desc = "Lazygit" },
    { "gB", function() require("snacks").gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },

    -- gh
    { "<leader>gi", function() require("snacks").picker.gh_issue() end, desc = "GitHub Issues (open)" },
    { "<leader>gI", function() require("snacks").picker.gh_issue({ state = "all" }) end, desc = "GitHub Issues (all)" },
    { "<leader>gp", function() require("snacks").picker.gh_pr() end, desc = "GitHub Pull Requests (open)" },
    { "<leader>gP", function() require("snacks").picker.gh_pr({ state = "all" }) end, desc = "GitHub Pull Requests (all)" },

    -- rename
    { "<leader>cR", function() require("snacks").rename.rename_file() end, desc = "Rename file" },

    -- scratch 
    { "<leader>.", function () require("snacks").scratch() end, desc = "Toggle Scratch Buffer" },
    { "<leader>S", function () require("snacks").scratch.select() end, desc = "Select Scratch Buffer" },

    -- terminal
    { "<leader>tt", function() require("snacks").terminal.toggle(nil, { cwd = vim.fn.getcwd() }) end, desc = "Terminal (Split)" },
    { "<leader>tT", function() require("snacks").terminal.toggle(vim.o.shell, { cwd = vim.fn.getcwd() }) end, desc = "Terminal (Float)" },

    -- toggle
    -- <leader>us  -> toggle spell
    { "<leader>us", function() require("snacks").toggle.option("spell", { name = "Spelling" }):toggle() end, desc = "Toggle Spelling" },

    -- <leader>uw  -> toggle wrap
    { "<leader>uw", function() require("snacks").toggle.option("wrap", { name = "Wrap" }):toggle() end, desc = "Toggle Wrap" },

    -- <leader>uL  -> toggle relative number
    { "<leader>uL", function() require("snacks").toggle.option("relativenumber", { name = "Relative Number" }):toggle() end, desc = "Toggle Relative Number" },

    -- <leader>ud  -> toggle diagnostics
    { "<leader>ud", function() require("snacks").toggle.diagnostics():toggle() end, desc = "Toggle Diagnostics" },

    -- <leader>ul  -> toggle line number
    { "<leader>ul", function() require("snacks").toggle.line_number():toggle() end, desc = "Toggle Line Numbers" },

    -- <leader>uc  -> toggle conceallevel (0 <-> 2 o el actual)
    {
      "<leader>uc",
      function()
        require("snacks").toggle
        .option("conceallevel", { off = 0, on = (vim.o.conceallevel > 0 and vim.o.conceallevel or 2) })
        :toggle()
      end,
      desc = "Toggle Conceal",
    },

    -- <leader>uT  -> toggle treesitter highlight
    { "<leader>uT", function() require("snacks").toggle.treesitter():toggle() end, desc = "Toggle Treesitter" },

    -- <leader>ub  -> toggle background light/dark
    { "<leader>ub", function() require("snacks").toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):toggle() end, desc = "Toggle Dark Background" },

    -- <leader>uh  -> toggle inlay hints
    { "<leader>uh", function() require("snacks").toggle.inlay_hints():toggle() end, desc = "Toggle Inlay Hints" },

    -- <leader>ug  -> toggle indent guides
    { "<leader>ug", function() require("snacks").toggle.indent():toggle() end, desc = "Toggle Indent Guides" },

    -- <leader>uD  -> toggle dim
    { "<leader>uD", function() require("snacks").toggle.dim():toggle() end, desc = "Toggle Dim" },

    -- <leader>uz  -> toggle zen
    { "<leader>uz", function() require("snacks").toggle.zen():toggle() end, desc = "Toggle Zen" },
  },
}
