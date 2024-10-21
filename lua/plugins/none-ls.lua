return {
  {
    "davidmh/cspell.nvim",
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "html-lsp")
      table.insert(opts.ensure_installed, "css-lsp")
      table.insert(opts.ensure_installed, "json-lsp")
      table.insert(opts.ensure_installed, "tailwindcss-language-server")
      table.insert(opts.ensure_installed, "eslint-lsp")
      table.insert(opts.ensure_installed, "angular-language-server")
    end,
  },
  {

    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local cspell = require("cspell")
      opts.root_dir = opts.root_dir
        or require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git")
      opts.sources = vim.list_extend(opts.sources or {}, {
        cspell.diagnostics,
        cspell.code_actions,
      })
    end,
  },
}
