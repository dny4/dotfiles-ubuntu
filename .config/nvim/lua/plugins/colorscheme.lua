return {
  -- add githbub_dark
  { "projekt0n/github-nvim-theme" },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- Configure LazyVim to load
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "github_dark",
      --colorscheme = "github_dark_tritanopia",
      --colorscheme = "tokyonight-night",
      --colorscheme = "catppuccin-mocha",
    },
  },
}
