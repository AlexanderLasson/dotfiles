return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "Obsidian Vault",
        path = "~/oVault",
      },
      },
    daily_notes = {
        folder = "daily/",
        date_format = "%Y/%m/%Y-%m-%d-%A"
    },
  },
}
