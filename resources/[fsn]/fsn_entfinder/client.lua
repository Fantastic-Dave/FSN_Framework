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
  pickups = false
}

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

Citizen.CreateThread(function()
    while true do Citizen.Wait(0)
       if datastore.objects then datastore.objects = EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject) end
       if datastore.peds then datastore.peds = EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed) end
       if datastore.vehicles then datastore.vehicles = EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle) end
       if datastore.pickups then datastore.pickups = EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup) end
    end
end)
