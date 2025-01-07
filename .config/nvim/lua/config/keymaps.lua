-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.g.mapleader = " "

-- move lines and indent
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "<leader>zm", vim.cmd.ZenMode, { desc = "ZenMode" })

vim.keymap.set("n", "<leader>T", vim.cmd.Telescope, { desc = "Telescope" })

vim.keymap.set("n", "<leader>cts", vim.cmd.TailwindSort, { desc = "TailwindSort" })

LualineHidden = false
function ToggleLualine()
  if not LualineHidden then
    require("lualine").hide()
    LualineHidden = true
    print("Lualine hidden")
  else
    require("lualine").hide({ unhide = true })
    LualineHidden = false
    print("Lualine Unhidden")
  end
end

vim.keymap.set("n", "<leader>hl", ToggleLualine, { desc = "Toggle lualine" })
