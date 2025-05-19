local neotest = require 'neotest'

function filter_dir(name, rel_path, root)
  return true
end

function is_test_file(file_path)
  return true
end

---@type neotest.Adapter
local NeotestKotlinAdapter = {
  name = 'neotest-kotlin',
  filter_dir = filter_dir,
  is_test_file = is_test_file,
  discover_positions = position_discoverer.discover_positions,
  results = result_builder.build_results,
  root = function(dir)
    local root = root_finder.find_root(dir, lib.files.match_root_pattern)
    if root then
      ch.set_root(root)
    end
    return root
  end,
  build_spec = function(args)
    check_junit_jar(ch.get_context().config.junit_jar)

    -- TODO: find a way to avoid to make this steps every time

    -- find root
    local root = ch.get_context().root or root_finder.find_root(vim.fn.getcwd())
    assert(root, 'root directory not found')

    -- detect project type
    local project_type = detect_project_type(root)

    -- build spec
    return spec_builder.build_spec(args, project_type, ch.get_context().config)
  end,
}

return NeotestKotlinAdapter
