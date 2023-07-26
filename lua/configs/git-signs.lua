local git_signs_status_ok, git_signs = pcall(require, "gitsigns")
if not git_signs_status_ok then
    return
end

git_signs.setup()
