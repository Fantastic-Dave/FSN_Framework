local spots = {
  ["Bahama Mamas"] = {
    enter = {x = -1388.6383056641, y = -586.48455810547, z = 30.218963623047},
    exit = {x = -1387.5959472656, y = -588.03881835938, z = 30.319515228271},
    locked = false
  },
  ["The Morgue"] = {
    enter = {x = 240.86027526855, y = -1379.3193359375, z = 33.741725921631},
    exit = {x = 274.08386230469, y = -1360.3371582031, z = 24.5378074646},
    locked = false
  },
  ["The Thinking Box"] = {
    enter = {x = -1062.8592529297, y = -240.67185974121, z = 44.021133422852},
    exit = {x = -1063.5947265625, y = -239.77041625977, z = 44.021133422852},
    locked = false
  },
  ["Meeting Room"] = {
    enter = {x = -1048.2038574219, y = -238.30305480957, z = 44.021053314209},
    exit = {x = -1047.1921386719, y = -237.75674438477, z = 44.021053314209},
    locked = false
  }
}

function fsn_drawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    if onScreen then
        SetTextScale(0.3, 0.3)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 140)
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

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    for k, v in pairs(spots) do
      if GetDistanceBetweenCoords(v.enter.x, v.enter.y, v.enter.z, GetEntityCoords(GetPlayerPed(-1)), true) < 10 then
        DrawMarker(25,v.enter.x, v.enter.y, v.enter.z - 0.95, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 10.3, 255, 255, 255, 140, 0, 0, 2, 0, 0, 0, 0)
        if GetDistanceBetweenCoords(v.enter.x, v.enter.y, v.enter.z, GetEntityCoords(GetPlayerPed(-1)), true) < 1 then
          if v.locked then
            fsn_drawText3D(v.enter.x, v.enter.y, v.enter.z, "~r~"..k.." is locked!")
          else
            if IsControlJustPressed(0, 51) then
              DoScreenFadeOut(1000)
              Citizen.Wait(1500)
              SetEntityCoords(GetPlayerPed(-1), v.exit.x, v.exit.y, v.exit.z)
              Citizen.Wait(1500)
              DoScreenFadeIn(2000)
            end
          end
        end
      end
      if GetDistanceBetweenCoords(v.exit.x, v.exit.y, v.exit.z, GetEntityCoords(GetPlayerPed(-1)), true) < 10 then
        DrawMarker(25,v.exit.x, v.exit.y, v.exit.z - 0.95, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 10.3, 255, 255, 255, 140, 0, 0, 2, 0, 0, 0, 0)
        if GetDistanceBetweenCoords(v.exit.x, v.exit.y, v.exit.z, GetEntityCoords(GetPlayerPed(-1)), true) < 1 then
          fsn_drawText3D(v.exit.x, v.exit.y, v.exit.z, "Press [E] to exit "..k)
          if IsControlJustPressed(0, 51) then
            DoScreenFadeOut(1000)
            Citizen.Wait(1500)
            SetEntityCoords(GetPlayerPed(-1), v.enter.x, v.enter.y, v.enter.z)
            Citizen.Wait(1500)
            DoScreenFadeIn(2000)
          end
        end
      end
    end
  end
end)

DoScreenFadeIn(0)
