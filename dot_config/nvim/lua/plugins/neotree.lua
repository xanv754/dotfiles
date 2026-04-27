-- lua/plugins/neotree.lua

---@type LazySpec
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      auto_clean_config = false,
      follow_current_file = {
        enabled = true,
      },
    },
    window = {
      position = "left",
      width = 30,
      mappings = {
        ["z"] = function(state)
          local node = state.tree:get_node()
          if node.type == "directory" then
            if node:is_expanded() then
              require("neo-tree.sources.filesystem.commands").close_node(state)
            else
              require("neo-tree.sources.filesystem.commands").expand_all_nodes(state, node)
            end
          end
        end,
      },
    },
    event_handlers = {
      {
        event = "file_opened",
        handler = function(file_path)
          require("neo-tree.command").execute({ action = "show" })
        end,
      },
      --- NUEVO EVENT HANDLER ---
      {
        event = "neo_tree_buffer_leave",
        handler = function()
          -- Esta lógica detecta si al cerrar un archivo nos quedamos sin búferes listados
          vim.schedule(function()
            local bufs = vim.fn.getbufinfo({ buflisted = 1 })
            if #bufs == 0 then
              -- Si no hay más archivos, nos aseguramos de que Neo-tree esté visible
              require("neo-tree.command").execute({ action = "show", source = "filesystem" })
            end
          end)
        end,
      },
    },
  },
}
