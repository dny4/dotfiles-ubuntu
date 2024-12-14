return {
  -- disable by default, use <leader>uh to enable for file
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
}
