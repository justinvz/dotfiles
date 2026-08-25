return {
  "Civitasv/cmake-tools.nvim",
  keys = {
    { "<leader>mg", "<cmd>CMakeGenerate<cr>", desc = "CMake Generate" },
    { "<leader>mb", "<cmd>CMakeBuild<cr>", desc = "CMake Build" },
    { "<leader>md", "<cmd>CMakeDebugCurrentFile<cr>", desc = "CMake Debug Current File" },
    { "<leader>mD", "<cmd>CMakeDebug<cr>", desc = "CMake Debug Selected Target" },
    { "<leader>mr", "<cmd>CMakeRun<cr>", desc = "CMake Run" },
    { "<leader>mt", "<cmd>CMakeSelectBuildType<cr>", desc = "CMake Select Build Type" },
    { "<leader>mx", "<cmd>CMakeSelectBuildTarget<cr>", desc = "CMake Select Target" },
    { "<leader>ml", "<cmd>CMakeSelectLaunchTarget<cr>", desc = "CMake Select Launch Target" },
  },
  opts = {
    cmake_configure_on_open = false,
    cmake_regenerate_on_save = false,
  },
}
