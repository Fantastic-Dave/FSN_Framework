------------------------------------------------------- system
local entityEnumerator = {
  __gc = function(enum)
    if enum.destructor and enum.handle then
      enum.destructor(enum.handle)
    end
    enum.destructor = nil
    enum.handle = nil
  end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
  return coroutine.wrap(function()
    local iter, id = initFunc()
    if not id or id == 0 then
      disposeFunc(iter)
      return
    end
    
    local enum = {handle = iter, destructor = disposeFunc}
    setmetatable(enum, entityEnumerator)
    
    local next = true
    repeat
      coroutine.yield(id)
      next, id = moveFunc(iter)
    until not next
    
    enum.destructor, enum.handle = nil, nil
    disposeFunc(iter)
  end)
end

------------------------------------------------------- datastore
local datastore = {
  peds = {},
  objects = false,
  vehicles = false,
  pickups = false,
  nearby = {
    peds = {},
    objects = {},
    vehicles = {},
    pickups = {}  
  }
}

local myPed = GetPlayerPed(-1)

------------------------------------------------------- exports
function getVehicles(nearby)
  if nearby then return datastore.nearby.vehicles else return datastore.vehicles end
end
function getPeds(nearby)
  if nearby then return datastore.nearby.peds else return datastore.peds end
end
function getPickups(nearby)
  if nearby then return datastore.nearby.pickups else return datastore.pickups end
end
function getObjects(nearby)
  if nearby then return datastore.nearby.objects else return datastore.objects end
end

function getPedNearCoords(x,y,z,Distance)
	for k, v in pairs(datastore.nearby.peds) do
		if GetDistanceBetweenCoords(GetEntityCoords(v), x, y, z, true) < Distance then
			return v
		end
	end
	return false
end

------------------------------------------------------- internals
function get_objects()
	return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

function get_pickups()
	return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
end

function get_vehicles()
	return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function get_peds()
	return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end
Citizen.CreateThread(function()
	while true do Citizen.Wait(0)
		if datastore.objects then
			datastore.objects = get_objects()
			datastore.nearby.objects = {}
			for v in datastore.objects do
				if GetDistanceBetweenCoords(GetEntityCoords(v), GetEntityCoords(myPed), true) < 50 then
					table.insert(datastore.nearby.objects, #datastore.nearby.objects+1, v)
				end
			end
		end
		if datastore.peds then
			datastore.peds = get_peds()
			datastore.nearby.peds = {}
			for v in datastore.peds do
				if GetDistanceBetweenCoords(GetEntityCoords(v), GetEntityCoords(myPed), true) < 50 then
					table.insert(datastore.nearby.peds, #datastore.nearby.peds+1, v)
				end
			end
		end
		if datastore.vehicles then
			datastore.vehicles = get_vehicles()
			datastore.nearby.vehicles = {}
			for v in datastore.vehicles do
				if GetDistanceBetweenCoords(GetEntityCoords(v), GetEntityCoords(myPed), true) < 50 then
					table.insert(datastore.nearby.vehicles, #datastore.nearby.vehicles+1, v)
				end
			end
		end
		if datastore.pickups then
			datastore.pickups = get_pickups()
			datastore.nearby.pickups = {}
			for v in datastore.pickups do
				if GetDistanceBetweenCoords(GetEntityCoords(v), GetEntityCoords(myPed), true) < 50 then
					table.insert(datastore.nearby.pickups, #datastore.nearby.pickups+1, v)
				end
			end
		end
		Citizen.Wait(500) 
	end
end)
