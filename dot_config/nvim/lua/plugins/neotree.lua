---@type LazySpec
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    close_if_last_window = false, -- No cierra neo-tree si es la última ventana
    open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
    filesystem = {
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
  },
  -- Abre neo-tree automáticamente al iniciar nvim
  init = function()
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        local arg = vim.fn.argv(0)
        if not arg or arg == "" or vim.fn.isdirectory(arg) == 1 then
          return
        end
        require("neo-tree.command").execute({ action = "show", source = "filesystem" })
        vim.cmd("wincmd l")
      end,
    })
  end,
}
