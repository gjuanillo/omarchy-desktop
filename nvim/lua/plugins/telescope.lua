return {
  {
    "nvim-telescope/telescope.nvim",
    keys = function()
      local builtin = require("telescope.builtin")

      local function find_files_hidden()
        builtin.find_files({ hidden = true })
      end

      local function live_grep_hidden()
        builtin.live_grep({
          additional_args = function()
            return { "--hidden", "--no-ignore" }
          end,
        })
      end

      return {
        { "<leader>ff", find_files_hidden, desc = "[F]ind [F]iles (incl. dotfiles)" },
        { "<leader>fg", live_grep_hidden, desc = "[F]ind by [G]rep (incl. dotfiles)" },
        { "<leader>fd", builtin.diagnostics, desc = "[F]ind [D]iagnostics" },
        { "<leader>fr", builtin.resume, desc = "[F]inder [R]esume" },
        { "<leader>f.", builtin.oldfiles, desc = "[F]ind [.] Recent Files" },
        { "<leader>fb", builtin.buffers, desc = "[F]ind Existing [B]uffers" },
      }
    end,
  },

  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = require("telescope.themes").get_dropdown({}),
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
