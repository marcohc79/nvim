-- lua_ls: Lua (configs de Neovim)
-- Instalar: :MasonInstall lua-language-server
-- Necesita configuración extra para que reconozca el global `vim`
-- de Neovim y no marque warnings de "Undefined global"
return {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      workspace = {
        checkThirdParty = false,
        library = { vim.env.VIMRUNTIME },
      },
    },
  },
}
