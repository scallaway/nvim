local M = {}

local get_map_options = function(custom_options)
    local options = { silent = true }
    if custom_options then
        options = vim.tbl_extend("force", options, custom_options)
    end
    return options
end

local map = function(mode, target, source, opts)
    vim.keymap.set(mode, target, source, get_map_options(opts))
end

M.buf_map = function(bufnr, mode, target, source, opts)
    opts = opts or {}
    opts.buffer = bufnr

    map(mode, target, source, get_map_options(opts))
end

M.buf_command = function(bufnr, name, fn, opts)
    vim.api.nvim_buf_create_user_command(bufnr, name, fn, opts or {})
end

M.work_config = nil

local has_work_config = function()
    -- If we don't have a work dir, we won't be able to get a work config
    if os.getenv("WORK_DIR") == nil then
        return false
    end

    -- Check if we can open the file
    local file = io.open(os.getenv("WORK_DIR") .. "/nvim/init.lua", "r")

    -- If we have a file, close it and state that we have access to it
    if file ~= nil then
        io.close(file)
        return true
    else
        return false
    end
end

if has_work_config() then
    M.work_config = dofile((os.getenv("WORK_DIR") or "") .. "/nvim/init.lua")
end

return M
