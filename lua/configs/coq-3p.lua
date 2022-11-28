local status_ok, coq3p = pcall(require, "coq_3p")
if not status_ok then
    return
end

coq3p({
    { src = "nvimlua", short_name = "nLUA" },
})
