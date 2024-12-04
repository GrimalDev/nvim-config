return {
  suppress_missing_scope = {
    projects_v2 = true,
  },
  colors = { -- used for highlight groups (see Colors section below)
    white = "#ffffff",
    grey = "#2A354C",
    black = "#000000",
    red = "#fdb8c0",
    dark_red = "#da3633",
    green = "#acf2bd",
    dark_green = "#238636",
    yellow = "#d3c846",
    dark_yellow = "#735c0f",
    blue = "#58A6FF",
    dark_blue = "#0366d6",
    purple = "#6f42c1",
  },
  mappings = {
    pull_request = {
      checkout_pr = { lhs = "<space>po", desc = "checkout PR" },
      merge_pr = { lhs = "<space>pm", desc = "merge commit PR" },
      add_reviewer = { lhs = "<space>va", desc = "add reviewer" },
      remove_reviewer = { lhs = "<space>vd", desc = "remove reviewer request" },
      reload = { lhs = "<C-r>", desc = "reload PR" },
      open_in_browser = { lhs = "<C-b>", desc = "open PR in browser" },
      copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },
      goto_file = { lhs = "gf", desc = "go to file" },
      add_assignee = { lhs = "<space>aa", desc = "add assignee" },
      remove_assignee = { lhs = "<space>ad", desc = "remove assignee" },
      create_label = { lhs = "<space>lc", desc = "create label" },
      add_label = { lhs = "<space>la", desc = "add label" },
      remove_label = { lhs = "<space>ld", desc = "remove label" },
      add_comment = { lhs = "<space>ca", desc = "add comment" },
      delete_comment = { lhs = "<space>cd", desc = "delete comment" },
      review_start = { lhs = "<space>vs", desc = "start a review for the current PR" },
      review_resume = { lhs = "<space>vr", desc = "resume a pending review for the current PR" },
    },
    review_thread = {
      add_comment = { lhs = "<space>ca", desc = "add comment" },
      delete_comment = { lhs = "<space>cd", desc = "delete comment" },
    },
    submit_win = {
      approve_review = { lhs = "<M-a>", desc = "approve review" },
      comment_review = { lhs = "<M-m>", desc = "comment review" },
      request_changes = { lhs = "<M-r>", desc = "request changes review" },
      close_review_tab = { lhs = "<M-c>", desc = "close review tab" },
    },
  },
}
