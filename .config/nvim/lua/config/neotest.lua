require("neotest").setup({
  adapters = {
    require("neotest-jest"),
    require("neotest-dotnet")({
      dap = {
        adapter_name = os.getenv("NEOTEST_CS_ADAPTER_NAME")
      }
    })
  }
})
