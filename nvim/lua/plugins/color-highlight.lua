return {
  "brenoprata10/nvim-highlight-colors",
  event = { "BufReadPost", "BufNewFile" },
  opts = function()
    return {
      render = "background", -- 'foreground' | 'first_column' | 'background'
      enable_named_colors = true,
      enable_tailwind = true,
    }
  end,
}
