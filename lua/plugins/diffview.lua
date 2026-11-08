-- lua/plugins/diffview.lua
return {
  "sindrets/diffview.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    local cb = require("diffview.config").diffview_callback
    local actions = require "diffview.actions"
    require("diffview").setup {
      enhanced_diff_hl = true,
      keymaps = {
        view = {
          ["<tab>"] = cb "select_next_entry",
          ["<s-tab>"] = cb "select_prev_entry",
          ["gf"] = cb "goto_file",
          ["<leader>e"] = cb "focus_files",
          ["<leader>b"] = cb "toggle_files",
          ["<leader>mgr"] = actions.diffget "ours", -- take our version
          ["<leader>mgl"] = actions.diffget "theirs", -- take their version
        },
        file_panel = {
          ["j"] = cb "next_entry",
          ["k"] = cb "prev_entry",
          ["<cr>"] = cb "select_entry",
          ["un"] = actions.restore_entry, -- restore entire file
        },
      },
    }
  end,
  keys = {
    { "<leader>mgd", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
    { "<leader>mgq", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
  },
}
