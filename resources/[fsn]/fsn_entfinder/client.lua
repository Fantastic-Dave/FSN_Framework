
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
  objects = {},
  vehicles = {},
  pickups = {}
}

function getVehicles()
  return datastore.peds
end
function getPeds()
  return datastore.vehicles
end
function getPickups()
  return datastore.pickups
end
function getObjects()
  return datastore.objects
end

Citizen.CreateThread(function()
    while true do Citizen.Wait(0)
       datastore.objects = EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
       datastore.peds = EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
       datastore.vehicles = EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
       datastore.pickups = EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
    end
end)
