
local Window = require("src.window")
local Object = require("src.object")
local Fovy = require("libs.fovy")
local Level = require("src.level")
local Global = require("src.global")

local Player = require("src.objects.player")

function void() end


Global.Player = Level.createObject(Object:new(Fovy.vec2(100, 100), Player.collision, Player.update, Player.draw), 100, 100)

Fovy.printTable(Level.objects)

function love.load() 
  -- Window stuff
  love.window.setTitle(Window.title)
  love.window.setMode(Window.size.width, Window.size.height)
end

function love.update(dt)
  for _, obj in ipairs(Level.objects) do
    obj.update(obj)
  end
end

function love.draw()
  for _, obj in ipairs(Level.objects) do
    obj.draw(obj)

		if Global.isDev then
			love.graphics.rectangle("line", obj.pos.x, obj.pos.y, obj.collision.width, obj.collision.height)
		end
  end
end

