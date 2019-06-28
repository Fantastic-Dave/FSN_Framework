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
	Util.Repeat(f: function, s=0: number)
		Easy way to repeat something for x amount of seconds, good for locking animations
]]
function Util.Repeat(f, s)
	Citizen.CreateThread(function()
		local start = GetGameTimer()
		local ms = s x 1000
		while true do
			Citizen.Wait(0)
			if start+ms =< GetGameTimer() then
				f()
			else
				break;		
			end
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
	Util.DrawText3D(x: number, y: number, z: number, text: string, col: Color, scale: number)
]]
function Util.DrawText3D(x, y, z, text, col, scale)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    if onScreen then
        SetTextScale(scale,scale)--(0.3, 0.3)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(col[1],col[2],col[3],col[4])--(255, 255, 255, 140)
        SetTextDropshadow(0, 0, 0, 0, 55)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

--[[
	Util.GetPlayers()
		Stolen from Frazzle in #scripting-gated, returns a table of players
]]
function Util.GetPlayers()
    local Players = {}
    for Index = 0, 256 do
        if NetworkIsPlayerActive(Index) then
            table.insert(Players, Index)
        end
    end

    return Players
end
	
--[[
	Util.GetClosestPlayer()
		Stolen from Frazzle in #scripting-gated, returns the closest player + how far away they are 
]]
function Util.GetClosestPlayer()
    local Players = self:GetPlayers()
    local ClosestDistance = -1
    local ClosestPlayer = -1
    local PlayerPed = PlayerPedId()
    local PlayerPosition = GetEntityCoords(PlayerPed, false)
    
    for Index = 1, #Players do
        local TargetPed = GetPlayerPed(Players[Index])
        if PlayerPed ~= TargetPed then
            local TargetCoords = GetEntityCoords(TargetPed, false)
            local Distance = #(PlayerPosition - TargetCoords)

            if ClosestDistance == -1 or ClosestDistance > Distance then
                ClosestPlayer = Players[Index]
                ClosestDistance = Distance
            end
        end
    end
    
    return ClosestPlayer, ClosestDistance
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
