local status_ok, render_markdown = pcall(require, "render-markdown")
if not status_ok then
  return
end

render_markdown.setup()
