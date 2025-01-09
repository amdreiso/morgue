
local Window = require("src.window")
local Player = require("src.player")

local playerOBJ

function love.load()
	Window.load()

	playerOBJ = Player.new(200, 300)

	for i = 1, 10 do
		print(math.random(10))
	end
end

function love.update(dt)
	playerOBJ:update(dt)
end

function love.draw()
	playerOBJ:draw()
end

