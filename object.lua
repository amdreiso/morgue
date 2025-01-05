
local Object = {}

function Object:new(position, collision, update, draw)
  local o = {}

  o.pos = position
  o.collision = collision

  o.update = update
  o.draw = draw

  setmetatable(o, self)
  self.__index = self

  return o
end

return Object

