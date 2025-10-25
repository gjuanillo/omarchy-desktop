return {
  -- Add extra LSPs through mason
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "jdtls",
        "harper_ls",
        "html",
        "emmet_ls",
        "cssls",
        "tailwindcss",
      },
    },
  },

  -- Additional LSP config overrides
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        harper_ls = {
          settings = {
            harper_ls = {
              linters = {
                SpellCheck = true,
                SpelledNumbers = false,
                AnA = true,
                SentenceCapitalization = true,
                UnclosedQuotes = true,
                WrongQuotes = false,
                LongSentences = true,
                RepeatedWords = true,
                Spaces = true,
                Matcher = true,
                CorrectNumberSuffix = true,
              },
            },
          },
        },
        emmet_ls = {
          filetypes = {
            "html",
            "css",
            "scss",
            "javascript",
            "javascriptreact",
            "typescriptreact",
            "svelte",
            "vue",
          },
        },
      },
    },
  },

  -- Extra UI enhancements
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- JDTLS is handled specially by LazyVim → keep but do not configure here
  { "mfussenegger/nvim-jdtls" },
}
