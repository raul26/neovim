return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    {
      "<leader>n",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
      end,
      desc = "Explorer NeoTree (Root Dir)",
    },
    {
      "<leader>cf",
      ":Neotree reveal<CR>",
      desc = "Open file in NeoTree",
    },
  },
  opts = {
    filesystem = {
      follow_current_file = { enabled = false },
    },
    window = {
      mappings = {
        ["o"] = "open",
      },
    },
  },
}
