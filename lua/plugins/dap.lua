-- lua/plugins/dap.lua
return {
  -- nvim-dap core plugin
  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap = require 'dap'

      -- Add configuration for JavaScript/TypeScript debugging
      dap.adapters.node2 = {
        type = 'executable',
        command = 'node',
        args = { os.getenv 'HOME' .. '/.local/share/nvim/mason/packages/node-debug2-adapter/out/src/nodeDebug.js' },
      }

      dap.configurations.javascript = {
        {
          type = 'node2',
          request = 'launch',
          program = '${file}',
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          protocol = 'inspector',
          console = 'integratedTerminal',
        },
      }

      dap.configurations.typescript = {
        {
          type = 'node2',
          request = 'launch',
          program = '${file}',
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          protocol = 'inspector',
          console = 'integratedTerminal',
        },
      }
    end,
  },

  -- UI for dap
  {
    'rcarriga/nvim-dap-ui',
    config = function()
      require('dapui').setup()
    end,
  },

  -- JavaScript/TypeScript debugger (VSCode Debug Adapter)
  {
    'mxsdev/nvim-dap-vscode-js',
    requires = { 'mfussenegger/nvim-dap' },
    config = function()
      require('dap-vscode-js').setup {
        node_path = 'node',
        debugger_path = os.getenv 'HOME' .. '/.local/share/nvim/mason/packages/js-debug-adapter',
        adapters = { 'pwa-node' },
      }
    end,
  },

  -- Add nvim-nio dependency
  { 'nvim-neotest/nvim-nio' },
}
