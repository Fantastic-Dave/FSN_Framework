blips = {}

RegisterNetEvent('fsn_cad:police:Alert')
AddEventHandler('fsn_cad:police:Alert', function(atitle, time, inumber, xpos, ypos, zpos)
  if ondutyPD then
    addBlip(atitle, inumber, xpos, ypos, zpos, 3, time)
  end
end)

RegisterNetEvent('fsn_cad:ems:Alert')
AddEventHandler('fsn_cad:ems:Alert', function(atitle, time, inumber, xpos, ypos, zpos)
  if ondutyEMS then
    addBlip(atitle, inumber, xpos, ypos, zpos, 1, time)
  end
end)


function addBlip(text, inumber, x, y, z, color, ttl)
	local blip = AddBlipForCoord(x, y, 0.01)
	SetBlipSprite(blip, inumber)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(text)
	EndTextCommandSetBlipName(blip)
	SetBlipAsShortRange(blip,true)
	SetBlipAsMissionCreatorBlip(blip,true)
	PulseBlip(blip)
	SetBlipFlashes(blip, true)
	SetBlipFlashInterval(blip, 650)
	SetBlipColour(blip, color)
	local removeTime = GetNetworkTime() + (ttl * 1000)
	blips[#blips+1] = {blipObject = blip, timeToDelete = removeTime, active = true}
end

Citizen.CreateThread(function()
	while true do
		Wait(5000)
		for i,v in ipairs(blips) do
			if blips[i].timeToDelete < GetNetworkTime() and blips[i].active then
				RemoveBlip(blips[i].blipObject)
				blips[i].active = false
			end
		end
	end
end)
