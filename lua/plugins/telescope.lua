return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Find string in cwd" },
    {
      "pr",
      function()
        require("telescope.builtin").lsp_references({ jump_type = "never" })
      end,
      desc = "Peek references",
    },
  },
  opts = function(_, opts)
    local actions = require("telescope.actions")

    opts.defaults = opts.defaults or {}
    opts.defaults.history = {
      path = vim.fn.stdpath("data") .. "/telescope_history.sqlite3",
      limit = 100,
    }

    opts.defaults.mappings = opts.defaults.mappings or {}
    opts.defaults.mappings.i = vim.tbl_extend("force", opts.defaults.mappings.i or {}, {
      ["<C-j>"] = actions.cycle_history_next,
      ["<C-k>"] = actions.cycle_history_prev,
      ["<C-h>"] = actions.preview_scrolling_left,
      ["<C-l>"] = actions.preview_scrolling_right,
    })
  end,
}
