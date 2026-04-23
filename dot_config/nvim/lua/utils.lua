local M = {}

--- Merge two or more tables together
---@param ... table Tables to merge
---@return table merged The merged table
function M.merge_tables(...)
  local result = {}
  for _, tbl in ipairs({...}) do
    if type(tbl) == "table" then
      for k, v in pairs(tbl) do
        if type(v) == "table" and type(result[k]) == "table" then
          result[k] = M.merge_tables(result[k], v)
        else
          result[k] = v
        end
      end
    end
  end
  return result
end

return M
