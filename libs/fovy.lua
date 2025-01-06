-- My "library" I guess idk how to use lua this is probably available already but i don't know
-- With the help of my good friend chat gpt

local Anim8 = require("libs.anim8")

Fovy = {}

function Fovy.tableLength(t)
	local count = 0
	for _ in pairs(t) do
		count = count + 1
	end
	return count
end

function Fovy.printTable(t, indent)
	if not indent then
		indent = 0
	end
	for k, v in pairs(t) do
		local prefix = string.rep("  ", indent)
		if type(v) == "table" then
			print(prefix .. k .. " = {")
			Fovy.printTable(v, indent + 1)
			print(prefix .. "}")
		else
			print(prefix .. k .. " = " .. tostring(v))
		end
	end
end

function Fovy.folderExists(folder)
	local info = love.filesystem.getInfo(folder)
	return info and info.type == "directory"
end

function Fovy.requireFolder(folder)
	local folderPath = folder:gsub("%.", "/")
	local items = love.filesystem.getDirectoryItems(folderPath) -- Get all items in the folder

	for _, item in ipairs(items) do
		local path = folderPath .. "/" .. item -- Full filesystem path to the item
		local info = love.filesystem.getInfo(path)

		if info then
			if info.type == "directory" then
				Fovy.requireFolder(folder .. "." .. item)
			elseif info.type == "file" and item:sub(-4) == ".lua" then
				local moduleName = folder .. "." .. item:sub(1, -5) -- Remove ".lua" extension
				require(moduleName)
			end
		end
	end
end

function Fovy.getDirection(x1, y1, x2, y2)
	local angleRadians = math.deg(math.atan2(y2 - y1, x2 - x1))
	if angleRadians < 0 then
		angleRadians = angleRadians + 360
	end
	return angleRadians
end

function Fovy.normalize(x, y)
	local length = math.sqrt(x * x + y * y)
	if length == 0 then
		return 0, 0
	end
	return x / length, y / length
end

function Fovy.dim(width, height)
	return {
		width = width,
		height = height,
	}
end

function Fovy.vec2(x, y)
	return {
		x = x,
		y = y,
	}
end

function Fovy.lerp(a, b, t)
	return a + t * (b - a)
end

function Fovy.hasSameVariable(obj1, obj2)
	for key in pairs(obj1) do
		if obj2[key] ~= nil then
			return true
		end
	end
	return false
end

function Fovy.sortInstances(a, b)
	return a.pos.y < b.pos.y
end

function Fovy.rect(x, y, width, height, color, mode)
	love.graphics.setColor(color)
	love.graphics.rectangle(mode or "fill", x - width / 2, y - height / 2, width, height)
end

function Fovy.newSprite(imageURL, width, height, gridRow, gridColumn, speed)
	local sprite = {}

	sprite.image = love.graphics.newImage(imageURL)
	sprite.grid = Anim8.newGrid(width, height, sprite.image:getWidth(), sprite.image:getHeight())
	sprite.anim = Anim8.newAnimation(sprite.grid(gridRow, gridColumn), speed)

	return sprite
end

function Fovy.sign(x)
	if x > 0 then
		return 1
	elseif x < 0 then
		return -1
	else
		return 0
	end
end

function Fovy.isColliding(obj1, obj2)
	local x1, y1, x2, y2 = obj1.pos.x, obj1.pos.y, obj2.pos.x, obj2.pos.y

	local w = x1 + obj1.collision.width / 2 > x2 - obj2.collision.width / 2
		and x1 - obj1.collision.width / 2 < x2 + obj2.collision.width / 2
	local h = y1 + obj1.collision.height / 2 > y2 - obj2.collision.height / 2
		and y1 - obj1.collision.height / 2 < y2 + obj2.collision.height / 2

	if w and h then
		print("Is Colliding")
	end
end

function Fovy.setFilter()
	love.graphics.setDefaultFilter("nearest", "nearest")
end

return Fovy
