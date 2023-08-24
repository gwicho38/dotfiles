local zk = require("zk")

return {
  zk.setup({
    picker = "fzf",
    lsp = {
      config = {
        cmd = {
          "zk",
          "lsp",
        },
        name = "zk",
      },
    },
    auto_attach = {
      enabled = true,
      filetypes = { "markdown" },
    },
  }),
}
