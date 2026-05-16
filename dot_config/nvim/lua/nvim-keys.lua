-- Módulo con la lógica del visualizador de keymaps.

local M = {}

-- --- Configuración ---
local config = {
  script = vim.fn.expand("~/.local/bin/nvim-keys"),
  mappings = vim.fn.expand("~/.config/nvim/lua/plugins/mappings.lua"),
  width = 0.80,
  height = 0.75,
}

-- --- Calcular dimensiones centradas ---
local function window_opts()
  local total_w = vim.o.columns
  local total_h = vim.o.lines

  local w = math.floor(total_w * config.width)
  local h = math.floor(total_h * config.height)
  local row = math.floor((total_h - h) / 2)
  local col = math.floor((total_w - w) / 2)

  return {
    relative = "editor",
    width = w,
    height = h,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
    title = " NvimKeys ",
    title_pos = "center",
    zindex = 50,
  }
end

-- --- Lógica de apertura (siempre desde modo normal) ---
local function do_open(path)
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_set_option_value("bufhidden", "wipe", { buf = buf })

  local win = vim.api.nvim_open_win(buf, true, window_opts())
  vim.api.nvim_set_option_value("winblend", 8, { win = win })
  vim.api.nvim_set_option_value("cursorline", true, { win = win })

  local cmd = config.script .. " " .. vim.fn.shellescape(path)
  vim.fn.termopen(cmd, {
    on_exit = function()
      if vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_close(win, true)
      end
    end,
  })

  vim.cmd("startinsert")

  local opts = { buffer = buf, silent = true }
  vim.keymap.set("t", "<Esc>", function()
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
  end, opts)
  vim.keymap.set("n", "q", function()
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
  end, opts)
end

-- --- Abrir la floating window con terminal ---
function M.open(mappings_path)
  local path = mappings_path or config.mappings

  if vim.fn.executable(config.script) == 0 then
    vim.notify(
      "[NvimKeys] Script no encontrado o no ejecutable: "
      .. config.script
      .. "\nInstálalo con: mv nvim-keys.py ~/.local/bin/nvim-keys && chmod +x ~/.local/bin/nvim-keys",
      vim.log.levels.ERROR
    )
    return
  end

  if vim.fn.filereadable(path) == 0 then
    vim.notify("[NvimKeys] No se encontró el archivo de mappings: " .. path, vim.log.levels.ERROR)
    return
  end

  -- Fuerza salida a modo normal antes de abrir, sin importar el modo actual.
  -- vim.defer_fn espera que el event loop drene el input pendiente del keypress.
  vim.api.nvim_feedkeys(
    vim.api.nvim_replace_termcodes("<Esc>", true, false, true),
    "nx", -- 'n': no remapear, 'x': ejecutar inmediatamente y vaciar la cola
    false
  )
  vim.defer_fn(function()
    do_open(path)
  end, 10)
end

return M
