--TriggerServerEvent('fsn_main:validatePlayer')
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(3000)
    if GetPlayerPed(-1) then
      TriggerEvent('fsn_main:charMenu')
      break
    end
  end
end)
