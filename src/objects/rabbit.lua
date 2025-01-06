
local Object = require("src.object")
local Fovy = require("libs.fovy")

local Rabbit = {}

Rabbit.collision = Fovy.dim(10, 15)

function Rabbit.update(obj)
	obj.pos.x = obj.pos.x + 1
end

function Rabbit.draw(obj)
end


return Rabbit


