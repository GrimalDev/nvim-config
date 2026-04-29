local M = {}

local html_script_type_languages = {
  importmap = "json",
  module = "javascript",
  ["application/ecmascript"] = "javascript",
  ["text/ecmascript"] = "javascript",
}

local non_filetype_match_injection_language_aliases = {
  ex = "elixir",
  pl = "perl",
  sh = "bash",
  ts = "typescript",
  uxn = "uxntal",
}

local function first_node(match, capture_id)
  local capture = match[capture_id]
  if type(capture) == "table" then
    return capture[1]
  end
  return capture
end

local function get_node_text(node, bufnr, opts)
  if not node or type(node.range) ~= "function" then
    return nil
  end

  local ok, text = pcall(vim.treesitter.get_node_text, node, bufnr, opts)
  if ok then
    return text
  end

  return nil
end

local function get_parser_from_markdown_info_string(injection_alias)
  local filetype = vim.filetype.match { filename = "a." .. injection_alias }
  return filetype or non_filetype_match_injection_language_aliases[injection_alias] or injection_alias
end

local function register_directives()
  local query = vim.treesitter.query

  query.add_directive("set-lang-from-mimetype!", function(match, _, bufnr, pred, metadata)
    local type_attr_value = get_node_text(first_node(match, pred[2]), bufnr)
    if not type_attr_value or type_attr_value == "" then
      return
    end

    local configured = html_script_type_languages[type_attr_value]
    if configured then
      metadata["injection.language"] = configured
      return
    end

    local parts = vim.split(type_attr_value, "/", {})
    metadata["injection.language"] = parts[#parts]
  end, { force = true })

  query.add_directive("set-lang-from-info-string!", function(match, _, bufnr, pred, metadata)
    local injection_alias = get_node_text(first_node(match, pred[2]), bufnr)
    if not injection_alias or injection_alias == "" then
      return
    end

    metadata["injection.language"] = get_parser_from_markdown_info_string(injection_alias:lower())
  end, { force = true })

  query.add_directive("downcase!", function(match, _, bufnr, pred, metadata)
    local capture_id = pred[2]
    local capture_metadata = metadata[capture_id]
    local text = get_node_text(first_node(match, capture_id), bufnr, { metadata = capture_metadata })
    if not text then
      return
    end

    metadata[capture_id] = metadata[capture_id] or {}
    metadata[capture_id].text = text:lower()
  end, { force = true })
end

local function register_predicates()
  local query = vim.treesitter.query

  query.add_predicate("nth?", function(match, _, _, pred)
    local node = first_node(match, pred[2])
    local n = tonumber(pred[3])
    if not node or not n or not node:parent() or node:parent():named_child_count() <= n then
      return false
    end

    return node:parent():named_child(n) == node
  end, { force = true })

  query.add_predicate("is?", function(match, _, bufnr, pred)
    local node = first_node(match, pred[2])
    if not node then
      return true
    end

    local ok, locals = pcall(require, "nvim-treesitter.locals")
    if not ok then
      return false
    end

    local types = { unpack(pred, 3) }
    local find_ok, _, _, kind = pcall(locals.find_definition, node, bufnr)
    return find_ok and vim.tbl_contains(types, kind)
  end, { force = true })

  query.add_predicate("kind-eq?", function(match, _, _, pred)
    local node = first_node(match, pred[2])
    if not node then
      return true
    end

    return vim.tbl_contains({ unpack(pred, 3) }, node:type())
  end, { force = true })
end

function M.setup()
  if vim.fn.has "nvim-0.12" ~= 1 then
    return
  end

  register_predicates()
  register_directives()
end

return M
