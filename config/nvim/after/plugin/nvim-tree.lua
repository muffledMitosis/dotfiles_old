vim.g.nvim_tree_auto_open = 1

require("nvim-tree").setup({
  --sort_by = "case_sensitive",
  --renderer = {
  --  group_empty = true,
  --},
  filters = {
    dotfiles = true,
  },
})
