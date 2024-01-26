require("mason").setup()
local dap = require("dap")


vim.keymap.set("n", "<C-b>", function() dap.toggle_breakpoint() end)
vim.keymap.set("n", "<leader>dc", function() dap.continue() end)



dap.adapters["pwa-node"] = {
    type = "server",
    host = "localhost",
    port = "${port}",
    executable = {
        command = "node",
        args = {
            "~/.local/share/nvim/mason/packages/js-debug-adapter/js-debug-adapter",
            "${port}"
        },
    },
}

dap.configurations.typescript = {
    {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        runtimeExecutable = "yarn ts-node",
        runtimeArgs = {
            "--project",
            "./node.tsconfig.json",
        },
        program = "${file}",
        cwd = "${workspaceFolder}",
        attachSimplePort = 9229,
    },
}
