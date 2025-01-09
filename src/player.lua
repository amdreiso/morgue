
local Fovy = require("libs.fovy")

local Player = {}
Player.__index = Player




function Player.new(x, y)
	local self = setmetatable({}, Player)

	self.pos = Fovy.vec2(x or 0, y or 0)
	self.velocity = Fovy.vec2()
	self.force = Fovy.vec2()
	self.speed = 1
	self.state = "idle"

	return self
end


local function movement(self) 
	local dx, dy = 0, 0

	if love.keyboard.isDown("w") then
		dy = dy - self.speed
	end

	if love.keyboard.isDown("a") then
		dx = dx - self.speed
	end

	if love.keyboard.isDown("s") then
		dy = dy + self.speed
	end

	if love.keyboard.isDown("d") then
		dx = dx + self.speed
	end

	local length = math.sqrt(dx * dx + dy * dy)
	if length > 0 then
		dx = dx / length
		dy = dy / length

		self.state = "move"
	else
		self.state = "idle"
	end

	self.velocity.x = dx + self.force.x
	self.velocity.y = dy + self.force.y

	self.pos.x = self.pos.x + self.velocity.x * self.speed
	self.pos.y = self.pos.y + self.velocity.y * self.speed
end


function Player:update(dt)
	movement(self)
end

function Player:draw()
	love.graphics.rectangle("line", self.pos.x, self.pos.y, 10, 10)
end

return Player

