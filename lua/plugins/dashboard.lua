local Dashboard = {}

Dashboard.config = function()
  if not lvim.builtin.dashboard.active then
    return
  end
end

return Dashboard
