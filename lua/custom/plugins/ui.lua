return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  cmd = 'Neotree',
  keys = {
    { 
      "<leader>fe",
      function()
        vim.notify("Comming from customs")
        require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
      end,
      desc = "Explorer NeoTree (Root Dir)",
    },
  },
  init = function()
    if vim.fn.argc(-1) == 1 then
      local stat = vim.uv.fs_stat(vim.fn.argv(0))
      if stat and stat.type == "directory" then
        require("neo-tree")
      end
    end
  end,
  -- {
  -- dependencies = {
  --     "nvim-neotest/nvim-nio",
  --     "nvim-lua/plenary.nvim",
  --     "antoinemadec/FixCursorHold.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --     "nvim-neotest/neotest-jest"
  --   },
  -- },
  -- keys = {
  --   {
  --     "<leader>tr",
  --     function()
  --       require("neotest").run.run()
  --     end,
  --     desc = "Neo test run",
  --   },
  -- },
  -- opts = function(_, opts) 
  --   vim.list_extend(opts.adapters, {
  --     require("nvim-neotest/neotest-jest")
  --   })
  -- end,
}
