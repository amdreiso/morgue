
local Window = require("window")
local Object = require("object")
local Fovy = require("fovy.fovy")
local Level = require("level")

function love.load() 
  -- Window stuff
  love.window.setTitle(Window.title)
  love.window.setMode(Window.size.width, Window.size.height)
end

function love.update(dt)
  for _, obj in ipairs(Level.objects) do
    obj.update()
  end
end

function love.draw()
  for _, obj in ipairs(Level.objects) do
    obj.draw()
  end
end

