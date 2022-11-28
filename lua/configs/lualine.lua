local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local function filesize()
    local file = vim.fn.expand("%:p")
    if file == nil or #file == 0 then
        return ""
    end
    local size = vim.fn.getfsize(file)
    if size <= 0 then
        return ""
    end

    local suffixes = { "B", "KiB", "MiB", "GiB" }

    local i = 1
    while size > 1024 and i < #suffixes do
        size = size / 1024
        i = i + 1
    end

    local format = i == 1 and "%d%s" or "%.2f%s"
    return string.format(format, size, suffixes[i])
end

lualine.setup({
    options = {
        theme = "onedark",
    },
    sections = {
        lualine_c = {
            "lsp_progress",
        },
        lualine_x = { { "filename", newfile_status = true, path = 1, shorting_target = 80 }, "filetype" },
        lualine_y = { filesize },
    },
})
