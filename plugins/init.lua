return {
  {
    "nvim-tree/nvim-web-devicons",
  },
  {
    "ibhagwan/fzf-lua",
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  },
  {
    "nvim-lua/plenary.nvim",
  },
  { import = "nvchad.blink.lazyspec" },
}
