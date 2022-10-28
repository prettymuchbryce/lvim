local Dashboard = {}

Dashboard.config = function()
  if not lvim.builtin.alpha.active then
    return
  end
end

return Dashboard
