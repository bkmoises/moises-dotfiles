return {
  -- debugger support
  {
    "mfussenegger/nvim-dap",
    keys = {
      {
        "<leader>B",
        "<cmd>lua require'dap'.toggle_breakpoint()<CR>",
        desc = "DAP: Toggle [B]reakpoint",
      },
    },
    config = function()
      local nmap = function(keys, func, desc)
        if desc then
          desc = "DAP: " .. desc
        end

        vim.keymap.set("n", keys, func, { desc = desc })
      end

      nmap("<F5>", "<cmd>lua require'dap'.continue()<CR>", "Continue")
      nmap("<F6>", "<cmd>lua require'dap'.step_into()<CR>", "Step Into")
      nmap("<F7>", "<cmd>lua require'dap'.step_over()<CR>", "Step Over")
      nmap("<F8>", "<cmd>lua require'dap'.step_out()<CR>", "Step Out")
      -- nmap("<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
      -- nmap("<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
      nmap("<leader>ro", ":lua require'dap'.repl.open()<CR>")

      require("nvim-dap-virtual-text").setup({})
      require("dapui").setup()

      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      dap.adapters.cppdbg = {
        id = "cppdbg",
        type = "executable",
        command = vim.fn.stdpath("data") .. "/mason/bin/OpenDebugAD7",
      }

      local function get_args()
        local input = vim.fn.input("Enter command line arguments: ")
        if input ~= "" then
          return vim.split(input, "%s+", { plain = false, trimempty = true })
        else
          return nil
        end
      end

      -- don't forget to add debug flag (e.g. -g for g++/gcc)
      dap.configurations.cpp = {
        {
          name = "default",
          type = "cppdbg",
          request = "launch",
          program = "a.out",
          cwd = "${workspaceFolder}",
          stopAtEntry = true,
          args = get_args,
        },
        {
          name = "custom",
          type = "cppdbg",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopAtEntry = true,
          args = get_args,
        },
        {
          name = "Attach to gdbserver :1234",
          type = "cppdbg",
          request = "launch",
          MIMode = "gdb",
          miDebuggerServerAddress = "localhost:1234",
          miDebuggerPath = "/usr/bin/gdb",
          cwd = "${workspaceFolder}",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          args = get_args,
        },
      }
      dap.configurations.c = dap.configurations.cpp
      dap.configurations.rust = dap.configurations.cpp

      -- icons
      local dap_breakpoint = {
        error = {
          text = "",
        },
        rejected = {
          text = "",
        },
        stopped = {
          text = "",
          texthl = "LspDiagnosticsSignInformation",
          linehl = "DiagnosticUnderlineInfo",
          numhl = "LspDiagnosticsSignInformation",
        },
      }

      vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
      vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)
      vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
    end,
  },

  { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
  { "theHamsta/nvim-dap-virtual-text" },
  {
    "mfussenegger/nvim-dap-python",
    ft = { "python" },
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      -- uses the debugypy installation by mason
      local debugpyPythonPath = require("mason-registry").get_package("debugpy"):get_install_path()
        .. "/venv/bin/python3"
      require("dap-python").setup(debugpyPythonPath, {})
    end,
  },
}
