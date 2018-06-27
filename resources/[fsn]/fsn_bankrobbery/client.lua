local current_time = 0
local cracking = false
local start_time = 0
local cracking_id = 0
function fsn_drawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    if onScreen then
        SetTextScale(0.2, 0.2)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
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
function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
  SetTextFont(font)
  SetTextProportional(0)
  SetTextScale(scale, scale)
  SetTextColour(r, g, b, a)
  SetTextDropShadow(0, 0, 0, 0,255)
  SetTextEdge(1, 0, 0, 0, 255)
  SetTextDropShadow()
  SetTextOutline()
  SetTextCentre(centre)
  SetTextEntry("STRING")
  AddTextComponentString(text)
  DrawText(x , y)
end
function round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end
function resultDisplay(accepted)
  if not accepted then
    Citizen.CreateThread(function()
      while true do
        Citizen.Wait(0)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        Citizen.Wait(20)
          drawTxt('~r~CODE REJECTED',4,1,0.5,0.25,0.6,255,255,255,255)
          PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
        break
      end
    end)
  else
    Citizen.CreateThread(function()
      local time = current_time
      while true do
        Citizen.Wait(0)
        if current_time > time + 10000 then
          drawTxt('~g~CODE ACCEPTED',4,1,0.5,0.25,0.6,255,255,255,255)
        end
      end
    end)
  end
end
local bankdoors = {
  -- LEGION SQUARE
  [1] = {hash=2121050683,x=148.026,y=-1044.363,z=29.506,tx=148.026,ty=-1044.363,tz=29.506,unlocked=false,unlocktime=0,keypad={
    x = 146.794,
    y = -1046.035,
    z = 29.36807,
    crackattempts = 0,
    code = 0,
    difficulty = 4 --amount of numbers in the lock
  }, status={
    openh = 141.799,
    closedh = 249.846,
    status = 'closed'
  }},
  -- VINEWOOD
  [2] = {hash=961976194,x=255.228,y=223.976,z=102.393,tx=255.228,ty=223.976,tz=102.393,unlocked=false,unlocktime=0,keypad={
    x = 253.19821166992,
    y = 228.48191833496,
    z = 101.68326568604,
    crackattempts = 0,
    code = 0,
    difficulty = 6 --amount of numbers in the lock
  }, status={
    openh = 36.399,
    closedh = 159.324,
    status = 'closed'
  }},
  -- PALETO
  [3] = {hash=-1185205679,x=-104.604,y=6473.443,z=31.79,tx=-104.604,ty=6473.443,tz=31.79,unlocked=false,unlocktime=0,keypad={
    x = -105.55908966064,
    y = 6471.998046875,
    z = 31.626714706421,
    crackattempts = 0,
    code = 0,
    difficulty = 4 --amount of numbers in the lock
  }, status={
    openh = 45.200,
    closedh = 162.799,
    status = 'closed'
  }},
}
local banklocations = {

}

AddEventHandler('fsn_main:character', function()
  TriggerServerEvent('fsn_bankrobbery:init')
end)

RegisterNetEvent('fsn_bankrobbery:init')
AddEventHandler('fsn_bankrobbery:init', function(tbl)
  for k, v in pairs(tbl) do
    local door = bankdoors[k]
    if v[1] == 'open' then
      door.status.status = v[1]
      TriggerEvent('fsn_bankrobbery:openDoor', k)
    elseif v[1] == 'closed' then
      door.status.status = v[1]
      TriggerEvent('fsn_bankrobbery:closeDoor', k)
    end
  end
end)

RegisterNetEvent('fsn_bankrobbery:openDoor')
AddEventHandler('fsn_bankrobbery:openDoor', function(id)
  local door = bankdoors[id]
  local _door = GetClosestObjectOfType(door.x, door.y, door.z, 1.0, door.hash, false, false, false)
  SetEntityHeading(_door, door.status.openh)
  door.status.status = 'open'
end)

RegisterNetEvent('fsn_bankrobbery:closeDoor')
AddEventHandler('fsn_bankrobbery:closeDoor', function(id)
  local door = bankdoors[id]
  local _door = GetClosestObjectOfType(door.x, door.y, door.z, 1.0, door.hash, false, false, false)
  SetEntityHeading(_door, door.status.closedh)
  door.status.status = 'closed'
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if cracking then
      local rem = start_time + 300
      if rem < current_time then
        TaskPlayAnim(GetPlayerPed(-1), 'mp_heists@keypad@', 'exit', 8.0, 1.0, -1, 0, 1.0, 0, 0, 0)
        cracking = false
        FreezeEntityPosition(GetPlayerPed(-1), false)
        local code = ''
        local door = bankdoors[cracking_id]
        for i=1,door.keypad.difficulty do
          code = code..tostring(math.random(0,9))
        end
        door.keypad.code = code
        door.keypad.crackattempts = 1
        TriggerEvent('fsn_notify:displayNotification', 'Keypad cracking succeeded code: <b>'..door.keypad.code, 'centerLeft', 5000, 'success')
        DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", door.keypad.difficulty)
        local editOpen = true
        while UpdateOnscreenKeyboard() == 0 or editOpen do
          drawTxt('Input a ~b~'..door.keypad.difficulty..'~w~ digit code:',4,1,0.5,0.35,0.6,255,255,255,255)
          drawTxt('~r~CRACKED CODE: ~g~'..code,4,1,0.5,0.30,0.6,255,255,255,255)
          if UpdateOnscreenKeyboard() ~= 0 then
            editOpen = false
            if UpdateOnscreenKeyboard() == 1 then
              codeinput = tostring(GetOnscreenKeyboardResult())
              if codeinput == door.keypad.code then
                resultDisplay(true)
                door.unlocked = true
              else
                resultDisplay(false)
                if door.keypad.crackattempts > 3 then
                  local pos = GetEntityCoords(GetPlayerPed(-1))
                  local coords = {
                    x = pos.x,
                    y = pos.y,
                    z = pos.z
                  }
                  TriggerServerEvent('fsn_police:dispatch', coords, 7)
                end
                DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "0000", "", "", "", door.keypad.difficulty)
                editOpen = true
                door.keypad.crackattempts = door.keypad.crackattempts + 1
              end
            end
          end
        Wait(1)
        end
      else
        drawTxt('||||||||| ~r~CRACKING IN PROGRESS~w~ |||||||||',4,1,0.5,0.30,0.6,255,255,255,255)
        drawTxt('~b~'..tostring(rem - current_time)..'~w~s remaining!',4,1,0.5,0.35,0.6,255,255,255,255)
      end
    end
    for k, door in pairs(bankdoors) do
      if GetDistanceBetweenCoords(door.x, door.y, door.z, GetEntityCoords(GetPlayerPed(-1)), true) < 10 then
        local _door = GetClosestObjectOfType(door.x, door.y, door.z, 1.0, door.hash, false, false, false)
        local CurrentHeading = GetEntityHeading(_door)
        ----- OLD DOOR THING
        if door.unlocked == true or exports.fsn_police:fsn_PDDuty() then
          fsn_drawText3D(door.tx,door.ty,door.tz+0.5, '~y~Hold [UP ARROW] to open door\nDEBUG: '..CurrentHeading)
          if IsControlPressed(1,27) then
            SetEntityHeading(_door, round(CurrentHeading, 1) -  0.4)
  					CurrentHeading = GetEntityHeading(_door)
          end
          ----- OLD DOOR THING
          if door.status.status == 'open' then
            fsn_drawText3D(door.tx,door.ty,door.tz, 'Press [E] to ~r~close~w~ the vault!')
            if IsControlJustPressed(1,51) then
              TriggerServerEvent('fsn_bankrobbery:vault:close', k)
            end
          else
            fsn_drawText3D(door.tx,door.ty,door.tz, 'Press [E] to ~g~open~w~ the vault!')
            if IsControlJustPressed(1,51) then
              TriggerServerEvent('fsn_bankrobbery:vault:open', k)
            end
          end
        else
          if GetDistanceBetweenCoords(door.keypad.x, door.keypad.y, door.keypad.z, GetEntityCoords(GetPlayerPed(-1)), true) < 0.5 then
            if not cracking then
              SetTextComponentFormat("STRING")
              AddTextComponentString("Press ~INPUT_PICKUP~ to input a code\nPress ~INPUT_LOOK_BEHIND~ to begin cracking")
              DisplayHelpTextFromStringLabel(0, 0, 1, -1)
            end
            if IsControlJustPressed(1,51) and not cracking then
              ---------------------------------------------------
              if door.keypad.crackattempts == 0 then
                local code = ''
                for i=1,door.keypad.difficulty do
                  code = code..tostring(math.random(0,9))
                end
                door.keypad.code = code
              end
              ---------------------------------------------------
              print(door.keypad.code)
              door.keypad.crackattempts = door.keypad.crackattempts + 1
              DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "0000", "", "", "", door.keypad.difficulty)
              local editOpen = true
        			while UpdateOnscreenKeyboard() == 0 or editOpen do
                drawTxt('Input a ~b~'..door.keypad.difficulty..'~w~ digit code:',4,1,0.5,0.30,0.6,255,255,255,255)
        				if UpdateOnscreenKeyboard() ~= 0 then
        					editOpen = false
                  if UpdateOnscreenKeyboard() == 1 then
                    codeinput = tostring(GetOnscreenKeyboardResult())
                    if codeinput == door.keypad.code then
                      resultDisplay(true)
                      door.unlocked = true
                    else
                      resultDisplay(false)
                      if door.keypad.crackattempts > 3 then
                        local pos = GetEntityCoords(GetPlayerPed(-1))
                        local coords = {
                          x = pos.x,
                          y = pos.y,
                          z = pos.z
                        }
                        TriggerServerEvent('fsn_police:dispatch', coords, 7)
                      end
                      DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "0000", "", "", "", door.keypad.difficulty)
                      editOpen = true
                      door.keypad.crackattempts = door.keypad.crackattempts + 1
                    end
                  end
        				end
        			Wait(1)
        	    end
            end
            if IsControlJustPressed(1, 26) and not cracking then
              while not HasAnimDictLoaded('mp_heists@keypad@') do
                RequestAnimDict('mp_heists@keypad@')
                Citizen.Wait(5)
              end
              RequestAnimSet( "move_ped_crouched" )
              while ( not HasAnimSetLoaded( "move_ped_crouched" ) ) do
                  Citizen.Wait( 100 )
              end
              SetPedMovementClipset( GetPlayerPed(-1), "move_ped_crouched", 0.25 )
              FreezeEntityPosition(GetPlayerPed(-1), true)
              TaskPlayAnim(GetPlayerPed(-1), 'mp_heists@keypad@', 'enter', 8.0, 1.0, -1, 0, 1.0, 0, 0, 0)
              Citizen.Wait(1)
              TaskPlayAnim(GetPlayerPed(-1), 'mp_heists@keypad@', 'idle_a', 8.0, 1.0, -1, 49, 1.0, 0, 0, 0)
              start_time = current_time
              cracking_id = k
              cracking = true
            end
          else
            if door.keypad.code ~= 0 then
              TriggerEvent('fsn_notify:displayNotification', 'You walked away therefor the bank has reset the code!', 'centerLeft', 5000, 'error')
              door.keypad.crackattempts = 0
              door.keypad.code = 0
            end
            if cracking then
              TriggerEvent('fsn_notify:displayNotification', 'Keypad cracking failed', 'centerLeft', 5000, 'error')
              cracking = false
              start_time = 0
            end
          end
        end
      end
    end
  end
end)
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1000)
    current_time = current_time + 1
  end
end)
