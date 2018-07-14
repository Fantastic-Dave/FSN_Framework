local animal = -1
local droppeditems = {}
local hashes = {
    ['1689136297'] = 4,
    ['-832573324'] = 4,
    ['-2125992519'] = 1,
    ['-1430839454'] = 1,
    ['-2098044544'] = 1,
    ['1457690978'] = 1,
    ['2064779084'] = 1,
    ['402729631'] = 1,
    ['-1837301661'] = 3,
    ['-1469565163'] = 3,
    ['709452327'] = 8,
    ['-50684386'] = 8,
    ['1903324290'] = 4,
    ['1682622302'] = 4,
    ['1647367445'] = 4,
    ['-664053099'] = 4,
    ['-383047997'] = 1,
    ['802685111'] = 1,
    ['-815316634'] = 1,
    ['1794449327'] = 1,
    ['-2053253046'] = 3,
    ['-1323586730'] = 3,
    ['307287994'] = 3,
}
local harvesting = false
local harvestingstart = 0
function fsn_drawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    if onScreen then
        SetTextScale(0.3, 0.3)
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
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    for k, v in pairs(droppeditems) do
      if GetDistanceBetweenCoords(GetEntityCoords(v[1]), GetEntityCoords(GetPlayerPed(-1)), true) < 5 then
        if v[2] == nil then
          if not harvesting then
            fsn_drawText3D(GetEntityCoords(v[1]).x,GetEntityCoords(v[1]).y,GetEntityCoords(v[1]).z, 'Press [~g~E~w~] to harvest')
            if IsControlJustPressed(0,51) then
              TaskStartScenarioInPlace(GetPlayerPed(-1), "CODE_HUMAN_MEDIC_KNEEL", 0, 1)
              harvesting = true
              harvestingstart = GetNetworkTime()
            end
          else
            fsn_drawText3D(GetEntityCoords(v[1]).x,GetEntityCoords(v[1]).y,GetEntityCoords(v[1]).z, 'Harvesting...')
            if harvestingstart + 6000 < GetNetworkTime() then
              v[2] = true
              harvesting = false
              harvestingstart = 0
            end
          end
        else
          fsn_drawText3D(GetEntityCoords(v[1]).x,GetEntityCoords(v[1]).y,GetEntityCoords(v[1]).z, '~r~Already harvested')
        end
      end
    end
    if IsPedShooting(GetPlayerPed(-1)) then
      animal, ass = Citizen.InvokeNative(0x2975c866e6713290, PlayerId(), Citizen.PointerValueIntInitialized(0))
      if IsEntityAPed(animal) then
        for k, v in pairs(hashes) do
          if tostring(GetEntityModel(animal)) == k then
            if IsEntityDead(animal) then
              if not table.contains(droppeditems, animal) then
                table.insert(droppeditems,#droppeditems+1, {animal, nil})
              end
            end
          end
        end
      end
    end
  end
end)
