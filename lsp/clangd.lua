-- clangd: C, C++ (también objc, cuda)
-- Instalar: sudo dnf install clang-tools-extra
-- Flags útiles para mejor experiencia de desarrollo
return {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--completion-style=detailed",
    "--function-arg-placeholders",
    "--fallback-style=none",
  },
}
