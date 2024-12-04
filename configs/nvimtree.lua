return {
    -- sync_root_with_cwd = true,
    -- respect_buf_cwd = false,
    update_cwd = false,
    update_focused_file = {
      enable = true,
      update_root = true,
      update_cwd = false,
    },

    git = {
      enable = true,
    },

    renderer = {
      highlight_git = true,
      icons = {
        show = {
          git = true,
        },
      },
    }
}