vim.cmd.hi("clear")
if vim.g.syntax_on ~= nil then
  vim.cmd.syntax("reset")
end

vim.o.termguicolors = true
vim.g.colors_name = "nordwave"

require("nordwave").setup()
