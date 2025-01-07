-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set

map({ "n" }, "<leader>q", ":bp<bar>sp<bar>bn<bar>bd<CR>", { desc = "Close buffer" })

map({ "n", "v" }, "<leader>f", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })

map({ "n" }, "pd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", { desc = "Peek definition" })
