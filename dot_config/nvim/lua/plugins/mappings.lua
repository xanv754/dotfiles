return {
  {
    "AstroNvim/astrocore",
    opts = {
      options = {
        opt = {
          clipboard = "unnamedplus"
        }
      },
      mappings = {
        n = {
          -- OTRAS TECLAS
          -- F2: Cambio de Nombre de Variables
          ["<F2>"] = {
            function()
              local clients = vim.lsp.get_active_clients({ bufnr = 0 })
              if next(clients) ~= nil then
                vim.lsp.buf.rename()
              else
                local word = vim.fn.expand("<cword>")
                vim.cmd(":%s/\\<" .. word .. "\\>/")
              end
            end,
            desc = "Rename symbol (LSP or basic)",
          },
          -- Tabulador: Indentación hacia la derecha
          ["<Tab>"] = { ">>", desc = "Indentar línea" },
          -- Inicio: Dirije al primer carácter con contenido
          ["<Home>"] = { "^", desc = "Ir al inicio del contenido" },
          -- F12: Ir a la definición de la variable
          ["<F12>"] = {
            function() vim.lsp.buf.definition() end,
            desc = "Ir a la definición (LSP)",
          },
          -- TECLA: SHIFT
          -- Shift + Flechas: Seleccionar
          ["<S-Up>"] = { "v<Up>", desc = "Seleccionar arriba" },
          ["<S-Down>"] = { "v<Down>", desc = "Seleccionar abajo" },
          ["<S-Left>"] = { "v<Left>", desc = "Seleccionar izquierda" },
          ["<S-Right>"] = { "v<Right>", desc = "Seleccionar derecha" },
          -- Shift + Tabulador: Desindentación hacia la izquierda
          ["<S-Tab>"] = { "<<", desc = "Desindentar línea" },
          -- Shift + Inicio: Selecciona desde el cursor hasta el primer carácter de la línea
          ["<S-Home>"] = { "v^", desc = "Seleccionar hasta el inicio de línea" },
          -- Shift + Fin: Selecciona desde el cursor hasta el final de la línea
          ["<S-End>"] = { "v$", desc = "Seleccionar hasta el final de línea" },
          -- Shift + F12: Ver referencias de Variables (dónde se usa la variable)
          ["<S-F12>"] = {
            function() vim.lsp.buf.references() end,
            desc = "Ver referencias (LSP)",
          },
          -- TECLA: ALT
          -- Guardar sin formatear
          ["<A-s>"] = { ":noautocmd w<cr>", desc = "Guardar sin formatear" },
          -- Alt + Flecha Arriba: Mover línea seleccionada hacia arriba
          ["<A-Up>"] = { ":m .-2<cr>==", desc = "Mover línea hacia arriba" },
          -- Alt + Flecha Abajo: Mover línea seleccionada hacia abajo
          ["<A-Down>"] = { ":m .+1<cr>==", desc = "Mover línea hacia abajo" },
          -- Mover buffers con Shift + Flechas
          ["<A-Right>"] = { function() require("astrocore.buffer").move(1) end, desc = "Mover buffer a la derecha" },
          ["<A-Left>"] = { function() require("astrocore.buffer").move(-1) end, desc = "Mover buffer a la izquierda" },
          -- Redimensionar Explorador de Archivos
          ["<A-.>"] = { ":vertical resize +5<cr>", desc = "Aumentar ancho de ventana" },
          ["<A-,>"] = { ":vertical resize -5<cr>", desc = "Disminuir ancho de ventana" },
          -- TECLA: CTRL
          -- Ctrl + .: Modo Insertar
          ["<C-.>"] = { "a", desc = "Entrar en modo insertar" },
          -- Ctrl + Q: Salir
          ["<C-q>"] = { "<cmd>q<cr>", desc = "Salir (Quit)" },
          -- Ctrl + S: Guardar Archivo
          ["<C-s>"] = { ":w<cr>", desc = "Save File" },
          -- Ctrl + Z: Deshacer
          ["<C-z>"] = { "u", desc = "Undo" },
          -- Ctrl + Y: Rehacer
          ["<C-y>"] = { "<C-r>", desc = "Redo" },
          -- Ctrl + V: Pegar
          ["<C-v>"] = { '"+p<cmd>startinsert!<cr>', desc = "Pegar desde el portapapeles" },
          -- Ctrl + E: Búsqueda de Archivos
          ["<C-e>"] = { function() require("telescope.builtin").find_files() end, desc = "Buscar archivos" },
          -- Ctrl + Flecha Derecha: Siguiente pestaña
          ["<C-Right>"] = {
            function() require("astrocore.buffer").nav(vim.v.count1) end,
            desc = "Siguiente buffer",
          },
          -- Ctrl + Flecha Izquierda: Pestaña anterior
          ["<C-Left>"] = {
            function() require("astrocore.buffer").nav(-vim.v.count1) end,
            desc = "Buffer anterior",
          },
          -- Ctrl + |: Split Vertical
          ["<C-|>"] = { "<cmd>vsplit<cr>", desc = "Vertical Split" },
          -- Ctrl + -: Split Horizontal
          ["<C-->"] = { "<cmd>split<cr>", desc = "Horizontal Split" },
          -- Ctrl + D: Selecciona la palabra actual e inicia el multicursor
          ["<C-d>"] = { "<Plug>(VM-Find-Under)", desc = "Selección múltiple" },
          -- Ctrl + F: Abre el buscador de palabras en el archivo actual
          ["<C-f>"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buscar en el archivo" },
          -- Ctrl + W: Cierra el Archivo
          ["<C-w>"] = {
            function()
              local bufs = vim.fn.getbufinfo { buflisted = true }
              require("astrocore.buffer").close(0)
              if #bufs <= 1 then vim.cmd "enew" end
            end,
            desc = "Cerrar pestaña",
          },
          -- COMBINACIÓN: CTRL + ALT
          -- Ctrl + Alt + Flecha Izquierda: Navegar al split de la izquierda
          ["<C-A-Left>"] = { "<C-w>h", desc = "Focus split izquierdo" },
          -- Ctrl + Alt + Flecha Derecha: Navegar al split de la derecha
          ["<C-A-Right>"] = { "<C-w>l", desc = "Focus split derecho" },
          -- Ctrl + Alt + Flecha Arriba: Navegar al split de arriba
          ["<C-A-Up>"] = { "<C-w>k", desc = "Focus split superior" },
          -- Ctrl + Alt + Flecha Abajo: Navegar al split de abajo
          ["<C-A-Down>"] = { "<C-w>j", desc = "Focus split inferior" },
        },
        i = {
          -- OTRAS TECLAS
          -- Inicio: Dirije al primer carácter con contenido
          ["<Home>"] = { "<Esc>^i", desc = "Ir al inicio del contenido" },
          -- F12: Ir a la definición
          ["<F12>"] = { "<Esc><cmd>lua vim.lsp.buf.definition()<CR>", desc = "Ir a la definición" },
          -- Shift + F12: Ver referencias de Variable (dónde se usa la variable)
          ["<F2>"] = { "<Esc><cmd>lua vim.lsp.buf.rename()<CR>", desc = "Renombrar símbolo" },
          -- TECLA: SHIFT
          -- Shift + Teclas: Seleccionar
          ["<S-Up>"] = { "<Esc>v<Up>", desc = "Seleccionar arriba" },
          ["<S-Down>"] = { "<Esc>v<Down>", desc = "Seleccionar abajo" },
          ["<S-Left>"] = { "<Esc>v<Left>", desc = "Seleccionar izquierda" },
          ["<S-Right>"] = { "<Esc>v<Right>", desc = "Seleccionar derecha" },
          -- Shift + Inicio: Selecciona hasta el inicio y queda en modo visual
          ["<S-Home>"] = { "<Esc>v^", desc = "Seleccionar hasta el inicio de línea" },
          -- Shift + Fin: Sale del modo insertar y selecciona hasta el final
          ["<S-End>"] = { "<Esc>v$", desc = "Seleccionar hasta el final de línea" },
          -- TECLA: ALT
          -- Redimensionar Explorador de Archivos
          ["<A-.>"] = { "<Esc>:vertical resize +5<cr>a", desc = "Aumentar ancho" },
          ["<A-,>"] = { "<Esc>:vertical resize -5<cr>a", desc = "Disminuir ancho" },
          -- Guardar sin Formatear
          ["<A-s>"] = { "<Esc>:noautocmd w<cr>a", desc = "Guardar sin formatear" },
          -- Alt + Flecha Arriba: Mover línea seleccionada hacia arriba
          ["<A-Up>"] = { "<Esc>:m .-2<cr>==gi", desc = "Mover línea hacia arriba" },
          -- Alt + Flecha Abajo: Mover línea seleccionada hacia abajo
          ["<A-Down>"] = { "<Esc>:m .+1<cr>==gi", desc = "Mover línea hacia abajo" },
          -- TECLA: CTRL
          -- Ctrl + .: Modo Normal
          ["<C-.>"] = { "<cmd>stopinsert<cr>", desc = "Entra en el modo normal" },
          -- Ctrl + Q: Salir del Editor
          ["<C-q>"] = { "<cmd>q<cr>", desc = "Salir (Quit)" },
          -- Ctrl + S: Guardar
          ["<C-s>"] = { "<Esc>:w<cr>a", desc = "Save File" },
          -- Ctrl + W: Cerrar Archivo
          ["<C-w>"] = {
            function()
              vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
              local bufs = vim.fn.getbufinfo { buflisted = true }
              require("astrocore.buffer").close(0)
              if #bufs <= 1 then vim.cmd "enew" end
            end,
            desc = "Cerrar pestaña desde modo insertar",
          },
          -- Ctrl + Z: Deshacer
          ["<C-z>"] = { "<Esc>ua", desc = "Undo" },
          -- Ctrl + Y: Rehacer
          ["<C-y>"] = { "<Esc><C-r>a", desc = "Redo" },
          -- Ctrl + V: Pegar
          ["<C-v>"] = { '<C-r>+', desc = "Pegar desde el portapapeles" },         
          -- Ctrl + X: Cortar
          ["<C-x>"] = { '<Esc>"+di', desc = "Cortar al portapapeles" },
          -- Ctrl + F: Abre el buscador de palabras en el archivo actual
          ["<C-f>"] = { "<Esc><cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buscar en el archivo" },
          -- Ctrl + |: Split Vertical
          ["<C-|>"] = { "<Esc><cmd>vsplit<cr>a", desc = "Vertical Split" },
          -- Ctrl + -: Split Horizontal
          ["<C-->"] = { "<Esc><cmd>split<cr>a", desc = "Horizontal Split" }, 
          -- COMBINACIÓN: CTRL + ALT
          -- Ctrl + Alt + Flecha Izquierda: Navegar al split de la izquierda
          ["<C-A-Left>"] = { "<Esc><C-w>h", desc = "Focus split izquierdo" },
          -- Ctrl + Alt + Flecha Derecha: Navegar al split de la derecha
          ["<C-A-Right>"] = { "<Esc><C-w>l", desc = "Focus split derecho" },
          -- Ctrl + Alt + Flecha Arriba: Navegar al split de arriba
          ["<C-A-Up>"] = { "<Esc><C-w>k", desc = "Focus split superior" },
          -- Ctrl + Alt + Flecha Abajo: Navegar al split de abajo
          ["<C-A-Down>"] = { "<Esc><C-w>j", desc = "Focus split inferior" },
        },
        v = {
          -- OTRAS TECLAS
          -- Tabulador: Indentar hacia la derecha
          ["<Tab>"] = { ">gv", desc = "Indentar bloque" },
          -- Inicio: Dirije al primer carácter con contenido
          ["<Home>"] = { "^", desc = "Ir al inicio del contenido" },
          -- F12: Ir a la definición de variable
          ["<F12>"] = { "<Esc><cmd>lua vim.lsp.buf.definition()<CR>", desc = "Ir a la definición" },
          -- Shift + F12: Ver referencias de variable (dónde se usa la variable)
          ["<F2>"] = { "<Esc><cmd>lua vim.lsp.buf.rename()<CR>", desc = "Renombrar símbolo" },
          -- TECLA: SHIFT
          -- Shift + Teclas: Seleccionar
          ["<S-Up>"] = { "<Up>", desc = "Extender selección arriba" },
          ["<S-Down>"] = { "<Down>", desc = "Extender selección abajo" },
          ["<S-Left>"] = { "<Left>", desc = "Extender selección izquierda" },
          ["<S-Right>"] = { "<Right>", desc = "Extender selección derecha" },
          --- Shift + Inicio: Selecciona hasta el inicio
          ["<S-Home>"] = { "^", desc = "Extender selección al inicio" },
          --- Shift + Fin: Selecciona hasta el fin
          ["<S-End>"] = { "$", desc = "Extender selección al final" },
          -- Shift + Tabulador: Desindentar hacia la izquierda
          ["<S-Tab>"] = { "<gv", desc = "Desindentar bloque" },
          -- TECLA: ALT
          -- Redimensionar Explorador de Archivos
          ["<A-.>"] = { "<Esc>:vertical resize +5<cr>gv", desc = "Aumentar ancho" },
          ["<A-,>"] = { "<Esc>:vertical resize -5<cr>gv", desc = "Disminuir ancho" },
          -- Guardar sin Formatear
          ["<A-s>"] = { "<Esc>:noautocmd w<cr>gv", desc = "Guardar sin formatear" },
          -- Alt + Flecha Arriba: Mover línea seleccionada hacia arriba
          ["<A-Up>"] = { ":m '<-2<cr>gv=gv", desc = "Mover bloque hacia arriba" },
          -- Alt + Flecha Abajo: Mover línea seleccionada hacia abajo
          ["<A-Down>"] = { ":m '>+1<cr>gv=gv", desc = "Mover bloque hacia abajo" },
          -- TECLA: CTRL
          -- Ctrl + z: Deshacer
          ["<C-z>"] = { "<Esc>ua", desc = "Undo" },
          -- Ctrl + .: Modo Normal
          ["<C-.>"] = { "<Esc>", desc = "Entrar al modo normal" },
          -- Ctrl + Q: Salir del Editor
          ["<C-q>"] = { "<cmd>q<cr>", desc = "Salir (Quit)" },
          -- Ctrl + S: Guardar Archivo
          ["<C-s>"] = { "<cmd>w<cr><Esc>", desc = "Save File" },
          -- Ctrl + W: Cerrar Archivo
          ["<C-w>"] = {
            function()
              vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
              local bufs = vim.fn.getbufinfo { buflisted = true }
              require("astrocore.buffer").close(0)
              if #bufs <= 1 then vim.cmd "enew" end
            end,
            desc = "Cerrar pestaña desde modo visual",
          },
          -- Ctrl + X: Cortar
          ["<C-x>"] = { '"+d', desc = "Cortar al portapapeles" },
          -- Ctrl + C: Copiar
          ["<C-c>"] = { '"+y', desc = "Copiar al portapapeles" },
          -- Ctrl + V: Pegar
          ["<C-v>"] = { '"+p<cmd>startinsert!<cr>', desc = "Pegar sobre selección" },
          -- Ctrl + D: Busca la siguiente ocurrencia de lo seleccionado
          ["<C-d>"] = { "<Plug>(VM-Find-Subword-Under)", desc = "Selección múltiple" },
          -- Ctrl + |: Split Vertical
          ["<C-|>"] = { "<Esc><cmd>vsplit<cr>", desc = "Vertical Split" },
          -- Ctrl + -: Split Horizontal
          ["<C-->"] = { "<Esc><cmd>split<cr>", desc = "Horizontal Split" },
          -- COMBINACIÓN: CTRL + ALT
          -- Ctrl + Alt + Flecha Izquierda: Navegar al split de la izquierda
          ["<C-A-Left>"] = { "<Esc><C-w>h", desc = "Focus split izquierdo" },
          -- Ctrl + Alt + Flecha Derecha: Navegar al split de la derecha
          ["<C-A-Right>"] = { "<Esc><C-w>l", desc = "Focus split derecho" },
          -- Ctrl + Alt + Flecha Arriba: Navegar al split de arriba
          ["<C-A-Up>"] = { "<Esc><C-w>k", desc = "Focus split arriba" },
          -- Ctrl + Alt + Flecha Abajo: Navegar al split de abajo
          ["<C-A-Down>"] = { "<Esc><C-w>j", desc = "Focus split inferior" },
        }
      },
    },
  },
}
