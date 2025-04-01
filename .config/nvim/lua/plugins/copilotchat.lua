return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = {
      cmd = "make tiktoken",
    },
    opts = {
      -- See Configuration section for options
    },
    -- See Commands section for default commands if you want to lazy load on them
    keys = {
      { "<leader>zc", ":CopilotChat<CR>", "n", desc = "Open Copilot Chat" },
      { "<leader>ze", ":CopilotChatExplain<CR>", "v", desc = "Explain Code" },
      { "<leader>zr", ":CopilotChatReview<CR>", "v", desc = "Review Code" },
      { "<leader>zf", ":CopilotChatFix<CR>", "v", desc = "Fix Code Issues" },
      { "<leader>zo", ":CopilotChatOptimize<CR>", "v", desc = "Optimize Code" },
      { "<leader>zd", ":CopilotChatDocs<CR>", "v", desc = "Generate Docs" },
      { "<leader>zt", ":CopilotChatTests<CR>", "v", desc = "Generate Tests" },
      { "<leader>zm", ":CopilotChatCommit<CR>", "n", desc = "Generate Commit Message" },
      { "<leader>zs", ":CopilotChatCommit<CR>", "v", desc = "Generate Commit for Selection" },
    },
  },
}
