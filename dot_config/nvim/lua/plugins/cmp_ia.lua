return {
  "saghen/blink.cmp",
  optional = true,
  dependencies = { "Exafunction/codeium.nvim" },
  opts = {
    sources = {
      default = { "codeium", "lsp", "path", "snippets", "buffer" },
      providers = {
        codeium = {
          name = "codeium",
          module = "codeium.blink",
          async = true,
        },
      },
    },
  },
}
