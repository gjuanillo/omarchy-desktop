return {
  -- Extend built-in gitsigns config
  {
    "lewis6991/gitsigns.nvim",
    keys = {
      {
        "<leader>gh",
        function()
          require("gitsigns").preview_hunk()
        end,
        desc = "Preview Hunk",
      },
    },
  },

  -- Add Fugitive commands + keymaps
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G" }, -- Lazy-load on Git commands
    keys = {
      { "<leader>gB", ":Git blame<CR>", desc = "Git Blame (Fugitive)" },
      { "<leader>gA", ":Git add .<CR>", desc = "Git Add All" },
      { "<leader>ga", ":Git add %<CR>", desc = "Git Add Current File" },
      { "<leader>gc", ":Git commit<CR>", desc = "Git Commit" },
      { "<leader>gp", ":Git push<CR>", desc = "Git Push" },
      { "<leader>gd", ":Gvdiffsplit<CR>", desc = "Git Diff Split" }, -- nice diff view
    },
  },
}
