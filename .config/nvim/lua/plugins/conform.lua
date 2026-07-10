return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      marksdown = { "prettier" },
      c = { "clang_format" },
      cpp = { "clang_format" },
    },
    formatters = {
      clang_format = {
        prepend_args = function(self, ctx)
          local home = vim.fn.expand("~")
          if vim.bo[ctx.buf].filetype == "cpp" then
            return { "--style=file:" .. home .. "/.clang-format-google" }
          else
            return { "--style=file:" .. home .. "/.clang-format" }
          end
        end,
      },
    },
  },
}
