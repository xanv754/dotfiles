---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        -- LSPs
        "pyright",
        "typescript-language-server",
        "html-lsp",
        "css-lsp",
        "bash-language-server",
        "rust-analyzer",
        "lua-language-server",

        -- Formatters
        "stylua",      -- Lua
        "prettier",    -- TS, HTML, CSS, JSON, YAML
        "black",       -- Python
        "shfmt",       -- Bash

        -- Linters
        "ruff",        -- Python
        "shellcheck",  -- Bash

        -- DAP
        "debugpy",     -- Python
        "codelldb",    -- Rust
      },
    },
  },
}
