local enterable_properties = {}
local char_id = 0
AddEventHandler('fsn_main:character', function(char)
  char_id = char.char_id
  TriggerServerEvent('fsn_properties:doors:request')
end)
RegisterNetEvent('fsn_properties:doors:init')
AddEventHandler('fsn_properties:doors:init', function(tbl)
  enterable_properties = tbl
end)

RegisterNetEvent('fsn_properties:doors:init')
AddEventHandler('fsn_properties:doors:init', function(tbl)
  print('got')
  enterable_properties = tbl
  for k, v in pairs(enterable_properties) do
    if v.blip ~= false then
      local blip = AddBlipForCoord(v.blip.x, v.blip.y, v.blip.z)
      SetBlipSprite(blip, 350)
      SetBlipAsShortRange(blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString("House")
      EndTextCommandSetBlipName(blip)
    end
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    for propertyk, property in pairs(enterable_properties) do
      if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)).x, GetEntityCoords(GetPlayerPed(-1)).y, GetEntityCoords(GetPlayerPed(-1)).z, property.blip.x, property.blip.y, property.blip.z, true) < 80 then
        ------------------------------------------ Management section
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)).x, GetEntityCoords(GetPlayerPed(-1)).y, GetEntityCoords(GetPlayerPed(-1)).z, property.blip.x, property.blip.y, property.blip.z, true) < 5 then
          DrawMarker(1,property.blip.x,property.blip.y,property.blip.z-1,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
          if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)).x, GetEntityCoords(GetPlayerPed(-1)).y, GetEntityCoords(GetPlayerPed(-1)).z, property.blip.x, property.blip.y, property.blip.z, true) < 1 then
            SetTextComponentFormat("STRING")
          	AddTextComponentString("Press ~INPUT_PICKUP~ to view the property")
          	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
            if IsControlJustPressed(0,38) then

  					end
          end
        end
        ------------------------------------------ Door stuff
        for _doork, _door in pairs(property.doors) do
          local door = GetClosestObjectOfType(_door.loc.x, _door.loc.y, _door.loc.z, 1.0, _door.hash, false, false, false)
          if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)).x, GetEntityCoords(GetPlayerPed(-1)).y, GetEntityCoords(GetPlayerPed(-1)).z, _door.loc.x, _door.loc.y, _door.loc.z, true) < 2 then
            if property.owner == char_id then
              if _door.locked then
                fsn_drawText3D(_door.text.x, _door.text.y, _door.text.z, "[E] ~g~Unlock")
                FreezeEntityPosition(door, true)
                if IsControlJustPressed(0,38) then
                  TriggerServerEvent('fsn_properties:door:unlock', propertyk, _doork)
                end
              else
                fsn_drawText3D(_door.text.x, _door.text.y, _door.text.z, "[E] ~r~Lock")
                FreezeEntityPosition(door, false)
                if IsControlJustPressed(0,38) then
                  TriggerServerEvent('fsn_properties:door:lock', propertyk, _doork)
                end
              end
            else
              if _door.locked then
                fsn_drawText3D(_door.text.x, _door.text.y, _door.text.z, "~r~LOCKED")
                FreezeEntityPosition(door, true)
              else
                FreezeEntityPosition(door, false)
              end
            end
          end
        end
        ----------------------------------------------------
      end
    end
  end
end)
