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

local holding = false
local holdingstart = 0
local holdingped = false
local holdingcar = false
local holdingnotif = false
local curtime = 0

Citizen.CreateThread(function()
	while true do Citizen.Wait(0)
		if IsPlayerFreeAiming(PlayerId()) then
			local ped =  exports["fsn_main"]:fsn_FindNearbyPed(10)
			if ped and IsPlayerFreeAimingAtEntity(PlayerId(), ped) then
				if IsPedInAnyVehicle(ped) then
					local speed = GetEntitySpeed(GetVehiclePedIsIn(ped, false)) * 3.6
					if speed > 3 then
						--ClearPedTasksImmediately(ped)
						fsn_drawText3D(GetEntityCoords(ped).x, GetEntityCoords(ped).y, GetEntityCoords(ped).z, '~r~scare me')
						holding = true
						holdingped = ped
						holdingstart = curtime
						holdingcar = GetVehiclePedIsIn(ped) 						
						TaskLeaveVehicle(ped, GetVehiclePedIsIn(ped), 256)
						if not holdingnotif then 
							TriggerEvent('fsn_notify:displayNotification', 'Holding up for keys...', 'centerRight', 3000, 'info')
							if math.random(1,100) < 40 then
								local pos = GetEntityCoords(GetPlayerPed(-1))
								local coords = {
									x = pos.x,
									y = pos.y,
									z = pos.z
								}
								local colour = table.pack(GetVehicleColours(holdingcar))
								colour = colour[1]
								colour = vehicle_colours[colour+1]
								local vehicle = GetDisplayNameFromVehicleModel(GetEntityModel(holdingcar))
								local plate = GetVehicleNumberPlateText(holdingcar)
								TriggerServerEvent('fsn_police:dispatch', coords, 10, '10-60 (ARMED) | Vehicle: '..vehicle..' | Plate: '..plate..' | Color: '..colour)
							end
							holdingnotif = true
						end
					end
				else
					if ped == holdingped then
						TaskStandStill(ped, 3000)
						if not IsEntityPlayingAnim(ped, 'random@mugging3', "handsup_standing_base", 3) then
							RequestAnimDict('random@mugging3')
							TaskPlayAnim(holdingped, "random@mugging3", "handsup_standing_base", 4.0, -4, -1, 49, 0, 0, 0, 0)
						end
						local maff = holdingstart + 9
						if maff < curtime then
							if math.random(0,100) > 60 then
								table.insert(myKeys, {holdingcar,true})
								TriggerEvent('fsn_notify:displayNotification', 'You got keys to the car...', 'centerRight', 3000, 'success')
								holding = false
								holdingstart = 0
								holdingped = false
								holdingcar = false
								holdingnotif = false
							else
								TriggerEvent('fsn_notify:displayNotification', 'No keys for you sucka', 'centerRight', 3000, 'error')
								holding = false
								holdingstart = 0
								holdingped = false
								holdingcar = false
								holdingnotif = false
							end
						end
					end
				end
			end
		else
			holding = false
			holdingstart = 0
			holdingped = false
			holdingcar = false
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		curtime = curtime+1
	end
end)