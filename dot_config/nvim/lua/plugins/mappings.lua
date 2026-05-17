return {
  {
    "AstroNvim/astrocore",
    opts = {
      options = {
        opt = {
          clipboard = "unnamedplus",
        },
      },
      mappings = {
        n = {
          ["<F2>"] = {
            function()
              local clients = vim.lsp.get_active_clients { bufnr = 0 }
              if next(clients) ~= nil then
                vim.lsp.buf.rename()
              else
                local word = vim.fn.expand "<cword>"
                vim.cmd(":%s/\\<" .. word .. "\\>/")
              end
            end,
            desc = "Renombrar: Variables",
          },
          ["<S-F12>"] = { -- TODO: Hacer que funcione
            function() vim.lsp.buf.references() end,
            desc = "Ver: Referencias",
          },
          ["<F12>"] = {
            function() vim.lsp.buf.definition() end,
            desc = "Ver: Definición",
          },
          ["<A-Right>"] = {
            function() require("astrocore.buffer").move(1) end,
            desc = "Mover: Pestaña de archivo hacia la derecha",
          },
          ["<A-Left>"] = {
            function() require("astrocore.buffer").move(-1) end,
            desc = "Mover: Pestaña de archivo hacia a la izquierda",
          },
          ["<C-w>"] = {
            function()
              local bufs = vim.fn.getbufinfo { buflisted = true }
              require("astrocore.buffer").close(0)
              if #bufs <= 1 then vim.cmd "enew" end
            end,
            desc = "Cerrar: Archivo",
          },
          ["<C-e>"] = {
            function() require("telescope.builtin").find_files() end,
            desc = "Buscar: Archivo",
          },
          ["<C-Right>"] = {
            function() require("astrocore.buffer").nav(vim.v.count1) end,
            desc = "Mover: Enfoque hacia la pestaña de la derecha",
          },
          ["<C-Left>"] = {
            function() require("astrocore.buffer").nav(-vim.v.count1) end,
            desc = "Mover: Enfoque hacia la pestaña de la izquierda",
          },
          ["<Tab>"] = { ">>", desc = "Identación: Añadir" },
          ["<Home>"] = { "^", desc = "Mover: Al inicio del archivo" },
          ["<S-Up>"] = { "<Esc>v<Up>", desc = "Seleccionar: Texto hacia arriba" },
          ["<S-Down>"] = { "<Esc>v<Down>", desc = "Seleccionar: Texto hacia abajo" },
          ["<S-Left>"] = { "<Esc>v<Left>", desc = "Seleccionar: Texto hacia la izquierda" },
          ["<S-Right>"] = { "<Esc>v<Right>", desc = "Seleccionar: Texto hacia la derecha" },
          ["<S-Tab>"] = { "<<", desc = "Identación: Quitar" },
          ["<S-Home>"] = {
            "v^",
            desc = "Seleccionar: Texto desde la posición del cursor hasta el inicio de la línea",
          },
          ["<S-End>"] = { "v$", desc = "Seleccionar: Texto desde la posición del cursor hasta el final de la línea" },
          ["<A-s>"] = { ":noautocmd w<cr>", desc = "Guardar: Archivo sin formatear" },
          ["<A-Up>"] = { ":m .-2<cr>==", desc = "Mover: Línea hacia arriba" },
          ["<A-Down>"] = { ":m .+1<cr>==", desc = "Mover: Línea hacia abajo" },
          ["<A-.>"] = { ":vertical resize +5<cr>", desc = "Ventana: Aumentar ancho" },
          ["<A-,>"] = { ":vertical resize -5<cr>", desc = "Ventana: Disminuir ancho" },
          ["<C-a>"] = { "ggVG", desc = "Seleccionar: Todo" },
          ["<C-.>"] = { "a", desc = "Cambiar: Al modo insertar" },
          ["<C-q>"] = { "<cmd>q<cr>", desc = "Cerrar: Ventana o editor" },
          ["<C-s>"] = { ":w<cr>", desc = "Guardar: Archivo" },
          ["<C-z>"] = { "u", desc = "Deshacer" },
          ["<C-y>"] = { "<C-r>", desc = "Rehacer" },
          ["<C-v>"] = { '"+p<cmd>startinsert!<cr>', desc = "Pegar: Desde el portapapeles" },
          ["<C-x>"] = { '"+dd', desc = "Cortar: Desde el portapapeles" },
          ["<C-c>"] = { '"+yy', desc = "Copiar: Desde el portapapeles" },
          ["<C-|>"] = { "<cmd>vsplit<cr>", desc = "Abrir: Nueva ventana hacia la derecha" },
          ["<C-->"] = { "<cmd>split<cr>", desc = "Abrir: Nueva ventana hacia abajo" },
          ["<C-d>"] = { "<Plug>(VM-Find-Under)", desc = "Seleccionar: Múltiple texto" },
          ["<C-f>"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buscar: En el archivo" },
          ["<C-A-Left>"] = { "<C-w>h", desc = "Mover: Enfoque hacia la ventana de la izquierda" },
          ["<C-A-Right>"] = { "<C-w>l", desc = "Mover: Enfoque hacia la ventana de la derecha" },
          ["<C-A-Up>"] = { "<C-w>k", desc = "Mover: Enfoque hacia la ventana de arriba" },
          ["<C-A-Down>"] = { "<C-w>j", desc = "Mover: Enfoque hacia la ventana de abajo" },
          ["<C-S-s>"] = { "<cmd>wa<cr>", desc = "Guardar: Todos los archivos" },
          ["<C-S-p>"] = { "<Esc><cmd>NvimKeys<cr>", desc = "Abrir: NvimKeys" },
        },
        i = {
          ["<C-w>"] = {
            function()
              vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
              local bufs = vim.fn.getbufinfo { buflisted = true }
              require("astrocore.buffer").close(0)
              if #bufs <= 1 then vim.cmd "enew" end
            end,
            desc = "Cerrar: Archivo",
          },
          ["<Home>"] = { "<Esc>^i", desc = "Mover: Al inicio del archivo" },
          ["<F12>"] = { "<Esc><cmd>lua vim.lsp.buf.definition()<CR>", desc = "Ver: Definición" },
          ["<F2>"] = { "<Esc><cmd>lua vim.lsp.buf.rename()<CR>", desc = "Renombrar: Variables" },
          ["<S-Up>"] = { "<Esc>v<Up>", desc = "Seleccionar: Texto hacia arriba" },
          ["<S-Down>"] = { "<Esc>v<Down>", desc = "Seleccionar: Texto hacia abajo" },
          ["<S-Left>"] = { "<Esc>v<Left>", desc = "Seleccionar: Texto hacia la izquierda" },
          ["<S-Right>"] = { "<Esc>v<Right>", desc = "Seleccionar hacia derecha" },
          ["<S-Home>"] = {
            "<Esc>v^",
            desc = "Seleccionar: Texto desde la posición del cursor hasta el inicio de la línea",
          },
          ["<S-End>"] = {
            "<Esc>v$",
            desc = "Seleccionar: Texto desde la posición del cursor hasta el final de la línea",
          },
          ["<A-s>"] = { "<Esc>:noautocmd w<cr>a", desc = "Guardar: Archivo sin formatear" },
          ["<A-Up>"] = { "<Esc>:m .-2<cr>==gi", desc = "Mover: Línea hacia arriba" },
          ["<A-Down>"] = { "<Esc>:m .+1<cr>==gi", desc = "Mover: Línea hacia abajo" },
          ["<A-.>"] = { "<Esc>:vertical resize +5<cr>a", desc = "Ventana: Aumentar ancho" },
          ["<A-,>"] = { "<Esc>:vertical resize -5<cr>a", desc = "Ventana: Disminuir ancho" },
          ["<C-a>"] = { "<Esc>ggVG", desc = "Seleccionar: Todo" },
          ["<C-.>"] = { "<cmd>stopinsert<cr>", desc = "Entra en modo normal" },
          ["<C-q>"] = { "<cmd>q<cr>", desc = "Cerrar: Ventana o editor" },
          ["<C-s>"] = { "<Esc>:w<cr>a", desc = "Guardar: Archivo" },
          ["<C-z>"] = { "<Esc>ua", desc = "Deshacer" },
          ["<C-y>"] = { "<Esc><C-r>a", desc = "Rehacer" },
          ["<C-v>"] = { "<C-r>+", desc = "Pegar: Desde el portapapeles" },
          ["<C-x>"] = { '<Esc>"+di', desc = "Cortar: Desde el portapapeles" },
          ["<C-c>"] = { '<Esc>"+yya', desc = "Copiar: Desde el portapapeles" },
          ["<C-|>"] = { "<Esc><cmd>vsplit<cr>a", desc = "Abrir: Nueva ventana hacia la derecha" },
          ["<C-->"] = { "<Esc><cmd>split<cr>a", desc = "Abrir: Nueva ventana hacia abajo" },
          ["<C-f>"] = { "<Esc><cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buscar: En el archivo" },
          ["<C-A-Left>"] = { "<Esc><C-w>h", desc = "Mover: Enfoque hacia la ventana de la izquierda" },
          ["<C-A-Right>"] = { "<Esc><C-w>l", desc = "Mover: Enfoque hacia la ventana de la derecha" },
          ["<C-A-Up>"] = { "<Esc><C-w>k", desc = "Mover: Enfoque hacia la ventana de arriba" },
          ["<C-A-Down>"] = { "<Esc><C-w>j", desc = "Mover: Enfoque hacia la ventana de abajo" },
          ["<A-a>"] = { "<Esc><cmd>wa<cr>a", desc = "Guardar: Todos los archivos" },
          ["<C-S-p>"] = { "<cmd>NvimKeys<cr>", desc = "Abrir: NvimKeys" },
        },
        v = {
          ["<C-w>"] = {
            function()
              vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
              local bufs = vim.fn.getbufinfo { buflisted = true }
              require("astrocore.buffer").close(0)
              if #bufs <= 1 then vim.cmd "enew" end
            end,
            desc = "Cerrar: Archivo",
          },
          ["<Tab>"] = { ">gv", desc = "Identación: Añadir" },
          ["<Home>"] = { "^", desc = "Mover: Al inicio del archivo" },
          ["<F12>"] = { "<Esc><cmd>lua vim.lsp.buf.definition()<CR>", desc = "Ver: Definición" },
          ["<F2>"] = { "<Esc><cmd>lua vim.lsp.buf.rename()<CR>", desc = "Renombrar: Variables" },
          ["<S-Up>"] = { "<Up>", desc = "Seleccionar: Texto hacia arriba" },
          ["<S-Down>"] = { "<Down>", desc = "Seleccionar: Texto hacia abajo" },
          ["<S-Left>"] = { "<Left>", desc = "Seleccionar: Texto hacia la izquierda" },
          ["<S-Right>"] = { "<Right>", desc = "Seleccionar: Texto hacia la derecha" },
          ["<S-Tab>"] = { "<gv", desc = "Identación: Quitar" },
          ["<S-Home>"] = { "^", desc = "Seleccionar: Texto desde la posición del cursor hasta el inicio de la línea" },
          ["<S-End>"] = { "$", desc = "Seleccionar: Texto desde la posición del cursor hasta el final de la línea" },
          ["<A-s>"] = { "<Esc>:noautocmd w<cr>gv", desc = "Guardar: Archivo sin formatear" },
          ["<A-Up>"] = { ":m '<-2<cr>gv=gv", desc = "Mover: Línea hacia arriba" },
          ["<A-Down>"] = { ":m '>+1<cr>gv=gv", desc = "Mover: Línea hacia abajo" },
          ["<A-.>"] = { "<Esc>:vertical resize +5<cr>gv", desc = "Ventana: Aumentar ancho" },
          ["<A-,>"] = { "<Esc>:vertical resize -5<cr>gv", desc = "Ventana: Disminuir ancho" },
          ["<C-a>"] = { "<Esc>ggVG", desc = "Seleccionar: Todo" },
          ["<C-.>"] = { "<Esc>", desc = "Entrar en modo normal" },
          ["<C-q>"] = { "<cmd>q<cr>", desc = "Cerrar: Ventana o editor" },
          ["<C-s>"] = { "<cmd>w<cr><Esc>", desc = "Guardar: Archivo" },
          ["<C-z>"] = { "<Esc>ua", desc = "Deshacer" },
          ["<C-y>"] = { "<Esc><C-r>", desc = "Rehacer" },
          ["<C-v>"] = { '"+p<cmd>startinsert!<cr>', desc = "Pegar: Desde el portapapeles" },
          ["<C-x>"] = { '"+d', desc = "Cortar: Desde el portapapeles" },
          ["<C-c>"] = { '"+y', desc = "Copiar al portapapeles" },
          ["<C-|>"] = { "<Esc><cmd>vsplit<cr>", desc = "Abrir: Nueva ventana hacia la derecha" },
          ["<C-->"] = { "<Esc><cmd>split<cr>", desc = "Abrir: Nueva ventana hacia abajo" },
          ["<C-d>"] = { "<Plug>(VM-Find-Subword-Under)", desc = "Seleccionar: Múltiple texto" },
          ["<C-A-Left>"] = { "<Esc><C-w>h", desc = "Mover: Enfoque hacia la ventana de la izquierda" },
          ["<C-A-Right>"] = { "<Esc><C-w>l", desc = "Mover: Enfoque hacia la ventana de la derecha" },
          ["<C-A-Up>"] = { "<Esc><C-w>k", desc = "Mover: Enfoque hacia la ventana de arriba" },
          ["<C-A-Down>"] = { "<Esc><C-w>j", desc = "Mover: Enfoque hacia la ventana de abajo" },
          ["<A-a>"] = { "<Esc><cmd>wa<cr>gv", desc = "Guardar: Todos los archivos" },
          ["<C-S-p>"] = { "<cmd>NvimKeys<cr>", desc = "Abrir: NvimKeys" },
        },
      },
    },
  },
}
