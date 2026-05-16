-- ~/.config/nvim/lua/plugins/nvim-keys.lua
-- Spec de lazy.nvim para el visualizador de keymaps.
-- Usa `false` como plugin (sin descarga) y registra el comando en `config`.

return {
  -- dir apunta a la config de nvim para que lazy no intente descargarlo
  dir = vim.fn.stdpath("config"),
  name = "nvim-keys",
  lazy = true,
  cmd = "NvimKeys", -- lazy-load: solo se activa al ejecutar :NvimKeys
  config = function()
    local nvim_keys = require("nvim-keys")

    vim.api.nvim_create_user_command("NvimKeys", function(args)
      local path = args.args ~= "" and args.args or nil
      nvim_keys.open(path)
    end, {
      nargs = "?",
      complete = "file",
      desc = "Abrir visualizador de keymaps personalizados",
    })
  end,
}
