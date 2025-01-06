
local Object = require("src.object")
local Fovy = require("libs.fovy")
local Global = require("src.global")

local Player = {
	-- Movement
	spd = 0.5,
	force = Fovy.vec2(0, 0),
	pos = Fovy.vec2(0, 0),

	collision = Fovy.dim(10, 15),
}


local function movement()
	local dx, dy = 0, 0

	if love.keyboard.isDown("w") then
		dy = dy - Player.spd
	end

	if love.keyboard.isDown("a") then
		dx = dx - Player.spd
	end

	if love.keyboard.isDown("s") then
		dy = dy + Player.spd
	end

	if love.keyboard.isDown("d") then
		dx = dx + Player.spd
	end

	local length = math.sqrt(dx * dx + dy * dy)
	if length > 0 then
		dx = dx / length
		dy = dy / length

		Player.state = "move"
	else
		Player.state = "idle"
	end

	Player.hsp = dx + Player.force.x * Global.gameSpeed
	Player.vsp = dy + Player.force.y * Global.gameSpeed

	Player.pos.x = Player.pos.x + Player.hsp * Player.spd
	Player.pos.y = Player.pos.y + Player.vsp * Player.spd
end


function Player.update(obj)
	movement()

	-- Set Player Instance
	for key, val in pairs(Player) do
		if key ~= "update" then
			Global.Player[key] = val
		end
	end
end

function Player.draw(obj)
end

return Player

