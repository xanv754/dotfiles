-- lua/plugins/neotree.lua

---@type LazySpec
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      -- Esto asegura que el explorador no se cierre al abrir un archivo
      auto_clean_config = false,
      follow_current_file = {
        enabled = true, -- Mantiene el foco en el archivo que estás editando
      },
    },
    window = {
      position = "left",
      width = 30,
    },
    -- El truco para que "nunca se vaya" es re-lanzarlo si detecta que se cerró un archivo
    event_handlers = {
      {
        event = "file_opened",
        handler = function(file_path)
          -- Forzamos a que se mantenga visible después de seleccionar un archivo
          require("neo-tree.command").execute({ action = "show" })
        end,
      },
    },
  },
}
