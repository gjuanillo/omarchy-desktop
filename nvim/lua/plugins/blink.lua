return {
  "saghen/blink.cmp",
  version = "*",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
  },
  opts = {
    sources = {
      default = { "lsp", "path", "buffer" },
    },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
    },
  },
}
