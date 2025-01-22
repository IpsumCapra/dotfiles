local dap = require('dap')
local dapui = require('dapui')

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

-- Used only for windows.
local utils = require('dap.utils')

local rpc = require('dap.rpc')

local function send_payload(client, payload)
  local msg = rpc.msg_with_content_length(vim.json.encode(payload))
  client.write(msg)
end

function RunHandshake(self, request_payload)
  local signResult = io.popen('node ' .. os.getenv("SignerPath") .. ' ' ..
    request_payload.arguments.value)
  if signResult == nil then
    utils.notify('error while signing handshake', vim.log.levels.ERROR)
    return
  end
  local signature = signResult:read("*a")
  signature = string.gsub(signature, '\n', '')
  local response = {
    type = "response",
    seq = 0,
    command = "handshake",
    request_seq = request_payload.seq,
    success = true,
    body = {
      signature = signature
    }
  }
  send_payload(self.client, response)
end

dap.adapters.csvsdbg = {
  id = 'coreclr',
  clientId = 'vscode',
  clientName = 'Visual Studio Code',
  type = 'executable',
  command = os.getenv("VsdbgPath"),
  args = { "--interpreter=vscode" },
  options = {
    externalTerminal = true,
  },
  runInTerminal = true,
  reverse_request_handlers = {
    handshake = RunHandshake,
  },
}

dap.adapters.coreclr = {
  type = 'executable',
  command = vim.fn.stdpath('data') .. '/mason/bin/netcoredbg',
  args = { '--interpreter=vscode' }
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "Launch - NetCoreDbg",
    request = "launch",
    justMyCode = false,
    stopAtEntry = false,
    program = function()
      return vim.fn.input('Path to DLL: ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end,
    cwd = vim.fn.getcwd()
  },
  {
    type = "coreclr",
    name = "Attach - NetCoreDbg",
    request = "attach",
    processId = require("dap.utils").pick_process,
  },
  {
    type = "csvsdbg",
    name = "Launch - vsdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path: ', vim.fn.getcwd() .. '\\bin\\Debug\\', 'file')
    end,
    cwd = vim.fn.getcwd(),
    externalTerminal = true,
    columnsStartAt1 = true,
    linesStartAt1 = true,
    locale = "en",
    pathFormat = "path",
    externalConsole = true
    -- console = "externalTerminal"
  },
}

dap.set_log_level("TRACE")
require("dap.ext.vscode").load_launchjs()
