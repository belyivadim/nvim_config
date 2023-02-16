local json_module = require("cjson")
local run_path = vim.fn.getcwd()

local M = {}

local current_terminal_buffer = 4

function M.TerminalToggle()
    local cmd = ""
    local vim_mode = vim.api.nvim_get_mode().mode
    if vim_mode == "t" then
        current_terminal_buffer = vim.api.nvim_get_current_buf()
        cmd = "<C-\\><C-n>:w<CR>"
    elseif vim_mode == "n" then
        cmd = "<C-\\><C-n>:buffer " .. current_terminal_buffer .. "<CR>"
    end
    return cmd
end

function ReadFile(filename)
    local file = io.open(filename, "r")

    if file == nil then
        return nil
    end

    local content = file:read("*a")
    io.close(file)

    return content
end

function VerifySettings(settings)
    local required_settings = {"PROJ_NAME"}

    for _, value in pairs(required_settings) do
        if settings[value] == nil then
            return value
        end
    end

    return nil
end

function M.ComptileAndRun()
    local json_content = ReadFile(run_path .. "/settings.json")

    if json_content == nil then
        return ":echo 'file `settings.json` was not found in current run path'<CR>"
    end

    local settings = json_module.decode(json_content)

    local missed_opt = VerifySettings(settings)
    if missed_opt ~= nil then
        return ":echo 'please specify `" .. missed_opt .. "` in your `settings.json`'<CR>"
    end

    return ":w<CR>:te make PROJ_NAME=" .. settings["PROJ_NAME"]
            .. "; ./" .. settings["PROJ_NAME"] .. ".out" .. "<CR>:set nonu<CR>a"
end

return M
