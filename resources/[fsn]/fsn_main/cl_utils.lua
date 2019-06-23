Util = {}

--[[
	Util.Tick(f: function, ms=0: number)
		A simple wrapper for CreateThread + while
]]
function Util.Tick(f, ms)
	Citizen.CreateThread(function()
		while true do
			f()
			Citizen.Wait(ms or 0)
		end
	end)
end

--[[
	struct Color
		{r: number, g: number, b: number, a: number}
]]
Color = {}
Color.White = {255,255,255,255}

--[[
	Util.DrawText(text: string, font: number, center: bool,
	              x: number, y: number, scale: number, col: Color)
]]
function Util.DrawText(text, font, center, x,y, scale, col)
	SetTextFont(font)
	SetTextScale(scale, scale)
	SetTextColour(col[1],col[2],col[3],col[4])
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextDropShadow() -- Probably don't need both of these
	SetTextOutline()
	SetTextCentre(center)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x, y)
end

--[[
	Iterators
		Util.FindObjects()
		Util.FindVehicles()
		Util.FindPickups()

		Usage:
		for ped in Util.FindPeds() do
			<do something with 'ped'>
		end
		Recommend using https://luafun.github.io/intro.html to filter etc

	https://gist.github.com/IllidanS4/9865ed17f60576425369fc1da70259b2
]]
do
	local gc = {}
	function gc.__gc(p)
		if p.h then p.d(p.h) end
		p.h, p.n, p.d = nil
	end
	local function gen(p, ent)
		ent = ent ~= -1 and ent or nil
		return ent, ent and select(2, p.n(p.h)) or gc.__gc(p)
	end
	local function iterator(init, next, drop)
		local handle, ent = init()
		local param = setmetatable({ha=handle, next=next, drop=drop}, gc)
		return gen, param, ent
	end

	function Util.FindObjects()
		return iterator(FindFirstObject, FindNextObject, EndFindObject)
	end

	function Util.FindVehicles()
		return iterator(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
	end

	function Util.FindPickups()
		return iterator(FindFirstPickup, FindNextPickup, EndFindPickup)
	end
end

--[[
local function iterator(init, next, drop)
	return coroutine.wrap(function()
		local iter, ent = init()
		if iter == -1 then return end
		
		local enum = setmetatable({i=iter, d=drop}, {__gc=gc})
		
		while ent ~= -1 do
			coroutine.yield(ent)
			_, ent = next(iter)
		end
		gc(enum)
	end)
end]]