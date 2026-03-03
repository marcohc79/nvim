return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",
  opts = {
    options = {
      -- UI
      show_buffer_close_icons = false,
      show_close_icon = false,
      separator_style = "slant", -- "slant" | "thin" | "padded_slant"
      diagnostics = "nvim_lsp",
      always_show_bufferline = true,


      close_command = "bd %d",
      right_mouse_command = "bd %d",

      custom_filter = function(bufnr)
        local bt = vim.bo[bufnr].buftype
        if bt == "terminal" or bt == "prompt" then
          return false
        end
        return true
      end,
    },
  },
}
