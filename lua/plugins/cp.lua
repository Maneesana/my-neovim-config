return {
  "xeluxee/competitest.nvim",
  dependencies = "muniftanjim/nui.nvim",
  config = function()
    require("competitest").setup {
      runner_ui = {
        interface = "split",
      },
      compile_command = {
        cpp = { exec = "g++", args = { "-std=c++20", "-O2", "-Wall", "$(FNAME)", "-o", "$(FNOEXT)" } },
      },
      run_command = {
        cpp = { exec = "./$(FNOEXT)" },
      },
      received_files_extension = "cpp",
      template_file = vim.fn.expand "~/.config/nvim/templates/template.cpp",
    }
  end,
  keys = {
    { "<leader>tc", "<cmd>CompetiTest receive contest<cr>", desc = "Receive Contest" },
    { "<leader>tp", "<cmd>CompetiTest receive problem<cr>", desc = "Receive Problem" },
    { "<leader>tr", "<cmd>CompetiTest run<cr>", desc = "Run Test Cases" },
    { "<leader>ta", "<cmd>CompetiTest add_testcase<cr>", desc = "Add Test Case" },
  },
}
