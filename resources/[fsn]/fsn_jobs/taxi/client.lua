local taxirank = {
  {x = 899.5673828125, y = -174.81382751465, z = 73.894668579102}
}

local function fsn_taxiAddBlip()
  yourtaxi_blip = AddBlipForEntity(yourtaxi)
  SetBlipSprite(yourtaxi_blip, 56)
  SetBlipRoute(yourtaxi_blip, true)
  SetBlipRouteColour(yourtaxi_blip, 5)
  BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Your taxi")
  EndTextCommandSetBlipName(yourtaxi_blip)
  SetBlipAsShortRange(yourtaxi_blip, false)
end

Citizen.CreateThread(function()
  -- Blip creation
	for k,v in pairs(taxirank) do
		local blip = AddBlipForCoord(v.x, v.y, v.z)
		SetBlipSprite(blip, 56)
		BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("Taxi Rank")
		EndTextCommandSetBlipName(blip)
		SetBlipAsShortRange(blip, true)
	end
  while true do
    Citizen.Wait(0)
    if yourtaxi then

    else
      if DoesBlipExist(yourtaxi_blip) then
        RemoveBlip(yourtaxi_blip)
      end
    end
    if istaxi then

    end
    for k, v in pairs(taxirank) do
      if GetDistanceBetweenCoords(v.x,v.y,v.z,GetEntityCoords(GetPlayerPed(-1)), true) < 10 then
        DrawMarker(1,v.x,v.y,v.z-1,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
        if GetDistanceBetweenCoords(v.x,v.y,v.z,GetEntityCoords(GetPlayerPed(-1)), true) < 1 then
          SetTextComponentFormat("STRING")
          AddTextComponentString("Press ~INPUT_PICKUP~ to get a Taxi ($250)")
        	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
          if IsControlJustPressed(0,38) then
            -- do things
          end
        end
      end
    end
  end
end)
