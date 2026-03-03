-- neocmakelsp: CMake (LSP moderno, más rápido que cmake-language-server)
-- https://github.com/neocmakelsp/neocmakelsp
-- Instalar: :MasonInstall neocmakelsp
return {
  cmd = { "neocmakelsp", "--stdio" },
  filetypes = { "cmake" },
  root_markers = { "CMakeLists.txt", "cmake" },
}
