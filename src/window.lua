
local Fovy = require("libs.fovy")

local Window = {}

Window.title = "game title HERE"
Window.size = Fovy.dim(1280, 720)
Window.fullscreen = false


function Window.load() 
	love.window.setTitle(Window.title)
	love.window.setMode(Window.size.width, Window.size.height, {
		fullscreen = Window.fullscreen
	})
end

return Window

