function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
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

local settings = {
  voices = {
    [1] = "WHISPERING",
    [2] = "NORMAL",
    [3] = "SHOUT"
  },
  ranges = {
    [1] = 2.0,
    [2] = 5.0,
    [3] = 12.0
  },
  current = 2
}

Citizen.CreateThread(function()
	while true do Citizen.Wait(1)
    if NetworkIsPlayerTalking(PlayerId()) then
      drawTxt(UI.x + 0.517, UI.y + 1.434, 1.0,1.0,0.4, settings.voices[settings.current], 66, 220, 244, 255)
    else
      drawTxt(UI.x + 0.517, UI.y + 1.434, 1.0,1.0,0.4, settings.voices[settings.current], 255, 255, 255, 255)
    end
    if IsControlJustPressed(0, 58) then
      if settings.current ~= 3 then
        settings.current = settings.current+1
      else
        settings.current = 1
      end
      NetworkSetTalkerProximity(settings.ranges[settings.current])
      NetworkSetVoiceActive(true)
    end
	end
end)
