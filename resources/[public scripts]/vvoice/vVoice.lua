local voiceChatProximity = "veryclose" -- default: veryclose
-- valid options are: veryclose, close, nearby, distant, far, veryfar, global.
local voiceEnabled = true
local allowProximityChange = false -- Allow people to change the chat proximity using /voice distance <proximity>
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

----------------- CODE DON'T TOUCH!!!! ---------------------

RegisterCommand("voice", function(source, args, rawCommand)
    if args[1] == "toggle" then
        if allowVoiceToggle then
            voiceEnabled = not voiceEnabled
            TriggerEvent('chatMessage', '', {255,255,255}, "^4Voice Chat is " .. (voiceEnabled == true and "^2enabled" or "^8disabled") .. "^4.")
        else
            TriggerEvent('chatMessage', '', {255,255,255}, "^4The ability to toggle voice chat is disabled, disable voice chat in your GTA V settings instead.")
        end
    elseif args[1] == "distance" then
        if allowProximityChange then
            if args[2] == "veryclose" then
                voiceChatProximity = args[2]
                TriggerServerEvent("updateClients", voiceChatProximity)
            elseif args[2] == "close" then
                voiceChatProximity = args[2]
                TriggerServerEvent("updateClients", voiceChatProximity)
            elseif args[2] == "nearby" then
                voiceChatProximity = args[2]
                TriggerServerEvent("updateClients", voiceChatProximity)
            elseif args[2] == "distant" then
                voiceChatProximity = args[2]
                TriggerServerEvent("updateClients", voiceChatProximity)
            elseif args[2] == "far" then
                voiceChatProximity = args[2]
                TriggerServerEvent("updateClients", voiceChatProximity)
            elseif args[2] == "veryfar" then
                voiceChatProximity = args[2]
                TriggerServerEvent("updateClients", voiceChatProximity)
            elseif args[2] == "global" then
                voiceChatProximity = args[2]
                TriggerServerEvent("updateClients", voiceChatProximity)
            else
                sendUsageMessage()
            end
        else
            TriggerEvent('chatMessage', '', {255,255,255}, "^4The ability to change the proximity has been disabled, contact the server owner if you believe that this is an error.")
        end
    else
        sendUsageMessage()
    end
end)

function sendUsageMessage()
    TriggerEvent('chatMessage', '', {255,255,255}, "^8Usage: ^0/voice [toggle|distance] <veryclose, close, nearby, distant, far, veryfar, global>")
end

local prox = 0.01

RegisterNetEvent("changeProximity")
AddEventHandler('changeProximity', function(vprox)
    if vprox == "veryclose" then
        prox = 25.01
    elseif vprox == "close" then
        prox = 75.01
    elseif vprox == "nearby" then
        prox = 200.01
    elseif vprox == "distant" then
        prox = 500.01
    elseif vprox == "far" then
        prox = 2500.01
    elseif vprox == "veryfar" then
        prox = 8000.01
    elseif vprox == "global" then
        prox = 0.00
    end
end)

function getProximity()
    if voiceChatProximity == "veryclose" then
        prox = 25.01
    elseif voiceChatProximity == "close" then
        prox = 75.01
    elseif voiceChatProximity == "nearby" then
        prox = 200.01
    elseif voiceChatProximity == "distant" then
        prox = 500.01
    elseif voiceChatProximity == "far" then
        prox = 2500.01
    elseif voiceChatProximity == "veryfar" then
        prox = 8000.01
    elseif voiceChatProximity == "global" then
        prox = 0.00
    end
end
getProximity()

function displayText(text, justification, red, green, blue, alpha, posx, posy)
    SetTextFont(4)
    SetTextWrap(0.0, 1.0)
    SetTextScale(1.0, 0.5)
    SetTextJustification(justification)
    SetTextColour(red, green, blue, alpha)
    SetTextOutline()

    BeginTextCommandDisplayText("STRING") -- old: SetTextEntry()
    AddTextComponentSubstringPlayerName(text) -- old: AddTextComponentString
    EndTextCommandDisplayText(posx, posy) -- old: DrawText()
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        NetworkSetTalkerProximity(prox)
        NetworkClearVoiceChannel()
        NetworkSetVoiceActive(voiceEnabled)
    end
end)