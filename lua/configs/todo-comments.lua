local status_ok, todo_comments = pcall(require, "todo-comments")
if not status_ok then
    return
end

todo_comments.setup({
    signs = false,
    keywords = {
        NOCHECKIN = { color = "warning" },
    },
    search = {
        -- TODO: add support for KEYWORDS(username) structure
        pattern = [[\b(KEYWORDS):]],
    },
})
