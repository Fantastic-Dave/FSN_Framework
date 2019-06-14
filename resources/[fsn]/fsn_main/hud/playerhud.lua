function drawRct(x,y,width,height,r,g,b,a)
	DrawRect(x + width/2, y + height/2, width, height, r, g, b, a)
end
oxygenTank = 25.0
local HudStage = 1
opacity = 0
fadein = false

local opacityBars = 0 
local Addition = 0.0

function getThirst()
	return exports["fsn_hungerandthirst"]:fsn_thirst()
end
function getHunger()
	return exports["fsn_hungerandthirst"]:fsn_hunger()
end

-- TODO: Cleanup this code
Citizen.CreateThread(function()
	while true do --Citizen.Wait(0)
		if HudStage == 4 then
			opacityBars = math.min(opacityBars + 1, 255)
			if Addition < 0.2 then
				Addition = Addition + 0.001
			end

			DrawRect(0,-0.2 + Addition, 2.0, 0.2, 1, 1, 1, opacityBars)
			DrawRect(0,1.20 - Addition, 2.0, 0.2, 1, 1, 1, opacityBars)
		else
			if opacityBars > 0 then
				opacityBars = opacityBars - 1
				Addition = Addition + 0.001
				DrawRect(0,0 - Addition, 2.0, 0.2, 1, 1, 1, opacityBars)
				DrawRect(0,0.98 + Addition, 2.0, 0.2, 1, 1, 1, opacityBars)				
			end
		end

		last_health = GetVehicleBodyHealth(GetVehiclePedIsIn(GetPlayerPed(-1),false))
		Citizen.Wait(1)

    	if not IsAimCamActive() or not IsFirstPersonAimCamActive() then
	        HideHudComponentThisFrame(14)
	    end


	    if IsHudComponentActive(1) then 
	        HideHudComponentThisFrame(1)
	    end

	    if IsHudComponentActive(6) then 
	        HideHudComponentThisFrame(6)
	    end

	    if IsHudComponentActive(7) then 
	        HideHudComponentThisFrame(7)
	    end

	    if IsHudComponentActive(9) then 
	        HideHudComponentThisFrame(9)
	    end

	    if IsHudComponentActive(0) and not IsPedInAnyVehicle(GetPlayerPed( -1 ), true) then 
	        HideHudComponentThisFrame(0)
	    end
		SetPedMinGroundTimeForStungun(GetPlayerPed(-1), 16000)
		if HudStage < 3 then
		    if opacity > 0 and not fadein then
		    	opacity = opacity - 10
		    end

		    if opacity < 250 and fadein then
		    	opacity = opacity + 10
		    end
			
			drawRct(0.015, 0.9677, 0.1418,0.028,81,81,84,165)
	
			local health = GetEntityHealth(GetPlayerPed(-1)) - 100
			if health < 1 then health = 100 end
			--(x,y,width,height,r,g,b,a)
			local varSet = 0.06938 * (health / 100)
			
			drawRct(0.016, 0.97, 0.06938,0.01,188,188,188,80)

			drawRct(0.016, 0.97, varSet,0.01,55,185,55,177)

			armor = GetPedArmour(GetPlayerPed(-1))
			if armor > 100.0 then armor = 100.0 end
			local varSet = 0.06938 * (armor / 100)
			drawRct(0.0865, 0.97, 0.06938,0.01,188,188,188,80)
			drawRct(0.0865, 0.97, varSet,0.01,115,115,255,177)

			
			varSet = 0.06938 * (getHunger() / 100)
			--drawRct(0.016, 0.983, 0.0268,0.01,188,188,188,80)
			drawRct(0.016, 0.983, 0.06938,0.01,188,188,188,80)
			drawRct(0.016, 0.983, varSet,0.01,137, 93, 4,177)

			varSet = 0.06938 * (getThirst() / 100)
			--drawRct(0.044, 0.983, 0.027,0.01,188,188,188,80)
			drawRct(0.0865, 0.983, 0.06938,0.01,188,188,188,80)
			drawRct(0.0865, 0.983, varSet,0.01,91, 255, 238,177)	
		end
	end
end)