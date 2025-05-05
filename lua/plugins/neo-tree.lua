local highlights = require("neo-tree.ui.highlights")
local function ends_with(str, ending)
  return string.sub(str, -#ending) == ending
end

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
      window = {
        mappings = {
          ["l"] = "noop",
          ["h"] = "noop",
          ["w"] = "noop",
          ["o"] = "open",
        },
      },
      components = {
        icon = function(config, node, state)
          local icon = config.default or " "
          local padding = config.padding or " "
          local highlight = config.highlight or highlights.FILE_ICON

          if node.type == "directory" then
            highlight = highlights.DIRECTORY_ICON
            if node:is_expanded() then
              icon = config.folder_open or "-"
            else
              icon = config.folder_closed or "+"
            end
          elseif node.type == "file" then
            local success, web_devicons = pcall(require, "nvim-web-devicons")
            if success then
              local devicon, hl = web_devicons.get_icon(node.name, node.ext)
              if ends_with(node.name, ".spec.ts") then
                hl = "MiniIconsGreen"
              end
              icon = devicon or icon
              highlight = hl or highlight
            end
          end

          return {
            text = icon .. padding,
            highlight = highlight,
          }
        end,
      },
    },
  },
}
