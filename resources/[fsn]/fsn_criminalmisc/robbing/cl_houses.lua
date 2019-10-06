local crafting = false
local crafting_start = 0
Citizen.CreateThread(function()
	local craft_spot = {x = 2358.9116210938, y = 3136.5368652344, z = 48.208744049072}
	--while true do Citizen.Wait(0)
		for k, v in pairs(robbables) do
			local bleep = AddBlipForCoord(v.x, v.y, v.z)
			SetBlipSprite(bleep, 1)
			SetBlipColour(bleep, 3)
			SetBlipAsShortRange(bleep, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("Robbable Property")
			EndTextCommandSetBlipName(bleep)
		end
	--end
	while true do Citizen.Wait(0)
		-- craft crowbar
		if GetDistanceBetweenCoords(craft_spot.x,craft_spot.y,craft_spot.z, GetEntityCoords(GetPlayerPed(-1)), true) < 10 then
			DrawMarker(25,craft_spot.x, craft_spot.y, craft_spot.z - 0.95, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 150, 0, 0, 2, 0, 0, 0, 0)
			if GetDistanceBetweenCoords(craft_spot.x,craft_spot.y,craft_spot.z, GetEntityCoords(GetPlayerPed(-1)), true) < 2 then
				Util.DrawText3D(craft_spot.x, craft_spot.y, craft_spot.z, '[E] Craft ~b~Crowbar', {255,255,255,200}, 0.25)
				if crafting then
					if crafting_start+5000 <= GetGameTimer() then
						print 'crafting false'
						crafting = false
						exports["fsn_progress"]:removeBar()
						TriggerEvent('fsn_inventory:item:take', 'aluminium', 2)
						TriggerEvent('fsn_inventory:item:take', 'steel', 5)
						
						TriggerEvent('fsn_inventory:items:add', {
								index = 'crowbar',
								name = 'Crowbar',
								amt = 2,
								data = {
									weight = 3.0
								},
							})
					else
						print 'still crafting'
						--exports["fsn_progress"]:removeBar()
					end
				else
					if IsControlJustPressed(0,38) then
						if exports["fsn_inventory"]:fsn_HasItem('aluminium') and exports["fsn_inventory"]:fsn_HasItem('steel') then
							if exports["fsn_inventory"]:fsn_GetItemAmount('aluminium') < 2 then
								exports['mythic_notify']:DoCustomHudText('error', 'You need 2 aluminium', 4000)					
								return
							end
							if exports["fsn_inventory"]:fsn_GetItemAmount('steel') < 5 then
								exports['mythic_notify']:DoCustomHudText('error', 'You need 5 steel', 4000)
								return
							end
							
							crafting = true
							crafting_start = GetGameTimer()
							exports["fsn_progress"]:fsn_ProgressBar(58, 133, 255,'Crafting',5)
						else
							exports['mythic_notify']:DoCustomHudText('error', 'You are missing a required resource.', 4000)
							
							TriggerEvent('fsn_inventory:items:add', {
								index = 'aluminium',
								name = 'Aluminium',
								amt = 2,
								data = {
									weight = 2.0
								},
							})
							TriggerEvent('fsn_inventory:items:add', {
								index = 'steel',
								name = 'Steel',
								amt = 5,
								data = {
									weight = 2.0
								},
							})
						end
					end
				end
			else
				if crafting then
					crafting = false
					--exports["fsn_progress"]:removeBar()
				end
			end
		end
	end
end)

local robbing = false
local robbing_id = false

RegisterNetEvent('fsn_criminalmisc:houserobbery:try')
AddEventHandler('fsn_criminalmisc:houserobbery:try', function()
	if exports["fsn_inventory"]:fsn_HasItem('crowbar') then
		if robbing then return end
		for k, v in pairs(robbables) do
			if GetDistanceBetweenCoords(v.x, v.y, v.z, GetEntityCoords(GetPlayerPed(-1)), true) < 2 then
				exports['mythic_notify']:DoCustomHudText('inform', 'Attempting to rob property: '..v.info..'.', 4000)
				robbing_id = k
				break
			end
		end
		
		if robbing_id then
			curHouseCoords = robbables[robbing_id]
			
			-- instance stuff
			
		else
			exports['mythic_notify']:DoCustomHudText('error', 'No property nearby.', 4000)
		end
	else
		exports['mythic_notify']:DoCustomHudText('error', 'You are missing a required resource.', 4000)
	end
end)

--SetEntityCoords(GetPlayerPed(-1), 347.04724121094,-1000.2844848633,-99.194671630859)
