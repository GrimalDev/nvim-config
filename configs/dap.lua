return function()
  local dap = require "dap"
  local dapui = require "dapui"

  dapui.setup()

  -- docker path
  local docker_path = "/var/www/html"
  local env_docker_path = os.getenv "DAP_DOCKER_PATH"
  if env_docker_path and type(env_docker_path) == "string" then
    docker_path = env_docker_path
  end

  local home = os.getenv "HOME"
  if not home then
    error "HOME environment variable is not set"
  end
  -- Ensure home is treated as a string
  home = tostring(home)
  if home:sub(-1) ~= "/" then
    home = home .. "/"
  end

  -- PHP --
  dap.adapters.php = {
    id = "php",
    type = "executable",
    command = "/Users/grimaldev/.local/share/nvim/mason/bin/php-debug-adapter",
    localSourceRoot = vim.fn.expand "%:p:h" .. "/",
    serverSourceRoot = vim.fn.expand "%:p:h" .. "/",
  }
  dap.configurations.php = {
    {
      name = "run current script",
      type = "php",
      request = "launch",
      port = 9003,
      cwd = "${fileDirname}",
      program = "${file}",
      runtimeExecutable = "php",
    },
    {
      name = "listen for Xdebug local",
      type = "php",
      request = "launch",
      port = 9003,
    },
    {
      name = "listen for Xdebug docker",
      type = "php",
      request = "launch",
      port = 9003,
      pathMappings = {
        ["/home/immo/www"] = "${workspaceFolder}",
      },
    },
  }

  -- Go adapter configuration
  dap.adapters.go = {
    type = "server",
    port = "44357",
    executable = {
      -- command = vim.fn.expand "/home/ewan/.local/share/nvim/mason/packages/go-debug-adapter/go-debug-adapter",
      command = vim.fn.expand(home .. "/.local/share/nvim/mason/packages/delve/dlv"),
      args = { "dap", "-l", "127.0.0.1:44357" },
    },
  }

  dap.configurations.go = {
    {
      type = "go",
      name = "Debug",
      request = "launch",
      program = "${file}",
    },
  }

  vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "ErrorMsg", linehl = "", numhl = "ErrorMsg" })
  vim.fn.sign_define("DapBreakpointCondition", { text = "⬤", texthl = "ErrorMsg", linehl = "", numhl = "SpellBad" })
  vim.fn.sign_define("DapStopped", { text = "", texthl = "ErrorMsg", linehl = "", numhl = "ErrorMsg" })

  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end
end
