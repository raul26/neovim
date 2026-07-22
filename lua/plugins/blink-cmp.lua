return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      menu = { auto_show = false },
    },
    keymap = {
      ["<Tab>"] = {
        function()
          if vim.snippet.active({ direction = 1 }) then
            vim.schedule(function()
              vim.snippet.jump(1)
            end)
            return true
          end
          local ok, vt = pcall(require, "codeium.virtual_text")
          if ok and vt.get_current_completion_item() then
            LazyVim.create_undo()
            local keys = vt.accept()
            vim.api.nvim_feedkeys(
              vim.api.nvim_replace_termcodes(keys, true, false, true),
              "n",
              false
            )
            return true
          end
        end,
        "fallback",
      },
    },
  },
}
