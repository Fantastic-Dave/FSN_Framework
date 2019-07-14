function drawHUDTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end
local UI = {
	x =  0.000,
	y = -0.001,
}

local mode = 'Normal'
local info = ''

RegisterNetEvent('fsn_voip:hud:updateInfo')
AddEventHandler('fsn_voip:hud:updateInfo', function(info)
	info = info
end)

Citizen.CreateThread(function()
  while true do Citizen.Wait(1)
	if talking then
      drawHUDTxt(UI.x + 0.517, UI.y + 1.434, 1.0,1.0,0.4, mode, 66, 220, 244, 255)
    else
      drawHUDTxt(UI.x + 0.517, UI.y + 1.434, 1.0,1.0,0.4, mode, 255, 255, 255, 255)
    end
	drawTxt(UI.x + 0.517, UI.y + 1.409, 1.0,1.0,0.4, info, 66, 220, 244, 255)
	--[[
	for k, v in pairs(radioChannels) do
		if v.users[tostring(localClientID)] then
			if DecorGetInt(GetPlayerPed(-1), "radio:talking") == 1 then
				drawTxt(UI.x + 0.517, UI.y + 1.409, 1.0,1.0,0.4, v.name, 66, 220, 244, 255)
			else
				drawTxt(UI.x + 0.517, UI.y + 1.409, 1.0,1.0,0.4, v.name, 255, 255, 255, 255)
			end
		end
	end
	]]
  end
end)