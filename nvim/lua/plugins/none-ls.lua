return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  opts = function(_, opts)
    local null_ls = require("null-ls")

    opts.sources = vim.list_extend(opts.sources or {}, {
      null_ls.builtins.formatting.stylua,
      require("none-ls.diagnostics.eslint_d"),
      null_ls.builtins.formatting.prettierd,
    })
  end,
}
