Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1)
    local myCoords = GetEntityCoords(GetPlayerPed(-1))
    if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -260.59494,6318.54052,32.43640, true ) < 50 then
      ClearAreaOfPeds(-260.59494,6318.54052,32.43640, 214.0, 0)
    end
  end
end)