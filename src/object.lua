
local Global = require("src.global")

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

function Object:create(name, obj)
	Global.objectList[name] = obj
end

return Object

