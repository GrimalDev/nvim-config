return {
  "rcarriga/nvim-dap-ui",

  dependencies = {
    {
      "mfussenegger/nvim-dap",
    },
    "nvim-neotest/nvim-nio",
  },
  init = require('configs.dap'),
}
