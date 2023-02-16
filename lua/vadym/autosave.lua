local function SaveIfChanged()
    local cb_info = vim.fn["getbufinfo"]('%')[1]
    if cb_info ~= nil and
        cb_info.name ~= "" and
        cb_info.changed == 1 then
        vim.api.nvim_command("write")
    end
end

-- Save on Leaving from insert mode
vim.api.nvim_create_autocmd("InsertLeave", {
    callback = SaveIfChanged,
})

-- autosave each n sec
local timer = nil
local function StartTimer()
    timer = vim.loop.new_timer()
    timer:start(0, 60000, vim.schedule_wrap(SaveIfChanged))
end

local function StopTimer()
    vim.loop.timer_stop(timer)
end

vim.api.nvim_create_autocmd("BufEnter", {
    callback = StartTimer,
})

vim.api.nvim_create_autocmd("BufLeave", {
    callback = StopTimer,
})

