
local Object = require("object")

local Level = {}

Level.objects = {}

function Level.createObject(obj, x, y)
  local o = obj
  o.pos.x = x
  o.pos.y = y
  
  table.insert(Level.objects, o) 
end

return Level
