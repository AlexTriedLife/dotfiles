return  {
    "Civitasv/cmake-tools.nvim",
    ft = { "c", "cpp", "cmake" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      cmake_build_directory = "build/${variant:buildType}",
      cmake_soft_link_compile_commands = true,
      cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" },
      cmake_build_options = { "-j", "8" },
      cmake_regenerate_on_save = true,
    },
    keys = {
      { "<leader>cg", "<cmd>CMakeGenerate<cr>", desc = "CMake Generate" },
      { "<leader>cb", "<cmd>CMakeBuild<cr>", desc = "CMake Build" },
      { "<leader>cr", "<cmd>CMakeRun<cr>", desc = "CMake Run" },
      { "<leader>cD", "<cmd>CMakeDebug<cr>", desc = "CMake Debug" },
      { "<leader>cy", "<cmd>CMakeSelectBuildType<cr>", desc = "CMake Build Type" },
      { "<leader>cT", "<cmd>CMakeSelectBuildTarget<cr>", desc = "CMake Target" },
    },
}
