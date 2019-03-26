local voiceChatProximity = "veryclose" -- default: veryclose
-- valid options are: veryclose, close, nearby, distant, far, veryfar, global.
local voiceEnabled = true
local allowProximityChange = true -- Allow people to change the chat proximity using /voice distance <proximity>
local allowVoiceToggle = false -- Allow people to disable voice chat for themseleves using /voice toggle


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
Citizen.CreateThread(function()
  while true do Citizen.Wait(1)
    if NetworkIsPlayerTalking(PlayerId()) then
      drawTxt(UI.x + 0.517, UI.y + 1.434, 1.0,1.0,0.4, 'NORMAL', 66, 220, 244, 255)
    else
      drawTxt(UI.x + 0.517, UI.y + 1.434, 1.0,1.0,0.4, 'NORMAL', 255, 255, 255, 255)
    end
end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        NetworkSetTalkerProximity(20.01)
        NetworkClearVoiceChannel()
        NetworkSetVoiceActive(true)
    end
end)
