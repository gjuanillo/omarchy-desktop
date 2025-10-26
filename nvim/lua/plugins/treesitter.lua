return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- Add more languages to ensure_installed
    opts.ensure_installed = vim.tbl_extend("force", opts.ensure_installed, {
      "java",
      "gitignore",
    })
  end,
}
