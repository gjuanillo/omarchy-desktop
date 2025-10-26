return {
  "pmizio/typescript-tools.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig",
  },
  opts = function(_, opts)
    opts.settings = opts.settings or {}
    opts.settings.tsserver_file_preferences = vim.tbl_extend("force", opts.settings.tsserver_file_preferences or {}, {
      includeInlayParameterNameHints = "all",
      includeCompletionsForModuleExports = true,
    })
    opts.settings.tsserver_format_options = vim.tbl_extend("force", opts.settings.tsserver_format_options or {}, {
      allowIncompleteCompletions = false,
    })
  end,
}
