Citizen.CreateThread(function()
  while true do
  	Citizen.Wait(1)
  	local myCoords = GetEntityCoords(GetPlayerPed(-1))
  	if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 971.48101806641,-118.74271392822,74.353134155273, true ) < 120 then
    	ClearAreaOfPeds(971.48101806641,-118.74271392822,74.353134155273, 58.0, 0)
    end
  end
end)