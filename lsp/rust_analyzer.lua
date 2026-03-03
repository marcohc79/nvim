-- rust_analyzer: Rust
-- https://rust-analyzer.github.io/book/configuration.html
-- Instalar: rustup component add rust-analyzer
return {
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
      checkOnSave = true,
      check = {
        command = "clippy",
      },
      procMacro = {
        enable = true,
      },
    },
  },
}
