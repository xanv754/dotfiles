---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "python",
      "typescript",
      "tsx",
      "html",
      "css",
      "bash",
      "rust",
      "json",
      "yaml",
      "toml",
    },
  },
}
