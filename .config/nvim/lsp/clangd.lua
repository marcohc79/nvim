-- clangd: C, C++
-- Instalar: sudo dnf install clang-tools-extra
return {
  cmd = {
    "clangd",
    "--background-index",
    "--header-insertion=iwyu",
    "--completion-style=detailed",
    "--function-arg-placeholders",
    "--fallback-style=none",
  },
}
