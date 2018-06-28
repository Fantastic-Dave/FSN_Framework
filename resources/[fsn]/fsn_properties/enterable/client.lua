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
    if v.rob_spot ~= false then
      local blip = AddBlipForCoord(v.rob_spot.x, v.rob_spot.y, v.rob_spot.z)
      SetBlipSprite(blip, 277)
      SetBlipColour(blip, 1)
      SetBlipAsShortRange(blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString("Unknown")
      EndTextCommandSetBlipName(blip)
    end
  end
end)
RegisterNetEvent('fsn_properties:doors:update')
AddEventHandler('fsn_properties:doors:update', function(tbl)
  enterable_properties = tbl
end)

AddEventHandler('fsn_properties:buy', function(id)
  local price = 0
  for k, _prop in pairs(enterable_properties) do
    if _prop.db_id == id then
      price = _prop.price
    end
  end
  if price ~= 0 then
    if exports.fsn_main:fsn_GetWallet() >= price then
      -- buy things
    else
      TriggerEvent('fsn_notify:displayNotification', 'You cannot afford this!', 'centerLeft', 5000, 'error')
    end
  end
end)

------------------------------------------------- MENU
AddEventHandler('fsn_properties:menu:access:allow', function(id)
  local _index = 0
  local _property = false
  for k, v in pairs(enterable_properties) do
    if v.db_id == id then
      _property = v
    end
  end
  if _property then
    Citizen.CreateThread(function()
      DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "#ID NUMBER", "", "", "", "", 10)
      local editOpen = true
      while UpdateOnscreenKeyboard() == 0 or editOpen do
        Wait(0)
        drawTxt('Input #ID',4,1,0.5,0.35,0.6,255,255,255,255)
        drawTxt('~r~DO NOT USE THE OVERHEAD NUMBER, USE #ID FROM THEIR ID CARD.',4,1,0.5,0.49,0.4,255,255,255,255)
        if UpdateOnscreenKeyboard() ~= 0 then
          editOpen = false
          if UpdateOnscreenKeyboard() == 1 then
            res = tostring(GetOnscreenKeyboardResult())
            TriggerServerEvent('fsn_properties:enterable:access:allow', id, res)
          end
          break
        end
      end
    end)
  end
end)
AddEventHandler('fsn_properties:menu:access:view', function(id)
  local _index = 0
  local _property = false
  for k, v in pairs(enterable_properties) do
    if v.db_id == id then
      _property = v
    end
  end
  if _property then
    local str = table.concat(_property.coowners,", ",1,#_property.coowners)
    TriggerEvent('chatMessage', '', {255,255,255}, '^*^4:fsn_properties:^0^r #IDs with access to this property: '..str)
    TriggerEvent('fsn_notify:displayNotification', 'Check the chatbox!!', 'centerLeft', 5000, 'info')
  end
end)
AddEventHandler('fsn_properties:menu:access:revoke', function(id)
  local _index = 0
  local _property = false
  for k, v in pairs(enterable_properties) do
    if v.db_id == id then
      _property = v
    end
  end
  if _property then
    Citizen.CreateThread(function()
      DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "#ID NUMBER", "", "", "", "", 10)
      local editOpen = true
      while UpdateOnscreenKeyboard() == 0 or editOpen do
        Wait(0)
        drawTxt('Input #ID',4,1,0.5,0.35,0.6,255,255,255,255)
        drawTxt('~r~DO NOT USE THE OVERHEAD NUMBER, USE #ID FROM THEIR ID CARD.',4,1,0.5,0.49,0.4,255,255,255,255)
        if UpdateOnscreenKeyboard() ~= 0 then
          editOpen = false
          if UpdateOnscreenKeyboard() == 1 then
            res = tostring(GetOnscreenKeyboardResult())
            usr = false
            for k, v in pairs(_property.coowners) do
              if v == res then
                usr = true
              end
            end
            if usr then
              TriggerServerEvent('fsn_properties:enterable:access:revoke', id, res)
            else
              TriggerEvent('fsn_notify:displayNotification', 'This #ID does not have access to your property.', 'centerLeft', 5000, 'error')
            end
          end
          break
        end
      end
    end)
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
          if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)).x, GetEntityCoords(GetPlayerPed(-1)).y, GetEntityCoords(GetPlayerPed(-1)).z, property.blip.x, property.blip.y, property.blip.z, true) < 1 and not menuEnabled then
            SetTextComponentFormat("STRING")
          	AddTextComponentString("Press ~INPUT_PICKUP~ to view the property")
          	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
            if IsControlJustPressed(0,38) then
              if property.owner ~= -1 then
                TriggerEvent('chatMessage', '', {255,255,255}, '^*^4:fsn_properties:^0^r This property (#'..property.db_id..') is owned by '..property.owner)
                if exports.fsn_police:fsn_getPDLevel() > 6 then hc = true else hc = false end
                local hasKeys = false for k, v in pairs(property.coowners) do if v == char_id then hasKeys = true end end
                if property.owner == char_id then propertyOwner = true hasKeys = true else propertyOwner = false end
                menuEnabled = not menuEnabled
                if hasKeys or hc then
                  SetNuiFocus( true, true )
              		SendNUIMessage({
              			showmenu = true,
                    updateProperty = true,
                    owned = true,
                    property_id = property.db_id,
                    inventory = json.encode(property.inventory),
                    weapons = json.encode(property.weapons),
                    money = property.money,
                    propertyOwner = propertyOwner,
                    propertyAccess = hasKeys,
                    policeHC = hc,
                  })
                else
                  TriggerEvent('fsn_notify:displayNotification', 'You do not have the keys to this property', 'centerLeft', 5000, 'error')
                end
              else
                TriggerEvent('chatMessage', '', {255,255,255}, '^*^4:fsn_properties:^0^r This property (#'..property.db_id..') is available to rent!')
                menuEnabled = not menuEnabled
                SetNuiFocus( true, true )
            		SendNUIMessage({
            			showmenu = true,
                  updateProperty = true,
                  owned = false,
                  price = property.price,
                  property_id = property.db_id,
                })
              end
  					end
          end
        end
        ------------------------------------------ Robbery stuff
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)).x, GetEntityCoords(GetPlayerPed(-1)).y, GetEntityCoords(GetPlayerPed(-1)).z, property.rob_spot.x, property.rob_spot.y, property.rob_spot.z, true) < 5 then
          DrawMarker(1,property.rob_spot.x,property.rob_spot.y,property.rob_spot.z-1,0,0,0,0,0,0,1.001,1.0001,0.4001,255,0,0,175,0,0,0,0)
          if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)).x, GetEntityCoords(GetPlayerPed(-1)).y, GetEntityCoords(GetPlayerPed(-1)).z, property.rob_spot.x, property.rob_spot.y, property.rob_spot.z, true) < 1 then
            SetTextComponentFormat("STRING")
          	AddTextComponentString("Press ~INPUT_RELOAD~ to ~r~ROB~w~ the property")
          	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
            if IsControlJustPressed(0,45) then

  					end
          end
        end
        ------------------------------------------ Door stuff
        for _doork, _door in pairs(property.doors) do
          local door = GetClosestObjectOfType(_door.loc.x, _door.loc.y, _door.loc.z, 1.0, _door.hash, false, false, false)
          if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)).x, GetEntityCoords(GetPlayerPed(-1)).y, GetEntityCoords(GetPlayerPed(-1)).z, _door.loc.x, _door.loc.y, _door.loc.z, true) < 10 then
            if _door.locked then
              FreezeEntityPosition(door, true)
            else
              FreezeEntityPosition(door, false)
            end
            if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)).x, GetEntityCoords(GetPlayerPed(-1)).y, GetEntityCoords(GetPlayerPed(-1)).z, _door.loc.x, _door.loc.y, _door.loc.z, true) < 2 then
              if property.owner == char_id then
                if _door.locked then
                  fsn_drawText3D(_door.text.x, _door.text.y, _door.text.z, "[E] ~g~Unlock")
                  if IsControlJustPressed(0,38) then
                    TriggerServerEvent('fsn_properties:door:unlock', propertyk, _doork)
                  end
                else
                  fsn_drawText3D(_door.text.x, _door.text.y, _door.text.z, "[E] ~r~Lock")
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
        end
        ----------------------------------------------------
      end
    end
  end
end)
