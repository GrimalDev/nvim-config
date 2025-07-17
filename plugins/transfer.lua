return {
  "coffebar/transfer.nvim",
  lazy = true,
  cmd = {
    "TransferInit",
    "DiffRemote",
    "TransferUpload",
    "TransferDownload",
    "TransferDirDiff",
    "TransferRepeat",
  },
  opts = {
    upload_rsync_params = { -- a table of strings or functions
      "-rlzi",
      "--delete",
      "--checksum",
      "--exclude",
      ".git",
      "--exclude",
      ".idea",
      "--exclude",
      ".DS_Store",
      "--exclude",
      ".nvim",
      "--exclude",
      "*.pyc",
    },
  },
}
