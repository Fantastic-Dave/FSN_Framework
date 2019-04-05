Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
    NetworkSetVoiceActive(false)
	end
end)
---------------------------------------- SOURCE
local playerList = {}
local userData = {}
local refreshRate = 100
local playerListRefreshRate = 5000
local pedDataRefreshRate = 2000
local lastPedDataUpdate = 0
local lastPlayerListUpdate = 0
local talkDistance = {}
talkDistance[1] = 15
talkDistance[2] = 2
talkDistance[3] = 40
local radioChannels = {
	["leo"] = {name = "[LEO]", users = {}},
	["ems"] = {name = "[EMS]", users = {}},
}
local modeNames = {}
modeNames[1] = "NORMAL"
modeNames[2] = "WHISPER"
modeNames[3] = "SHOUT"
local teamspeakChannel = "Servers/LIVE_SERVER1"--get channel path by typing in ts chat: /glgvoice channelpath
local teamspeakChannelName = "LIVE_SERVER1"--user friendly name of channel
local localClientID = -1
local localMode = 1
DecorRegister("voip:mode", 3)
DecorRegister("voip:clientID", 3)
DecorRegister("voip:talking", 3)
DecorRegister("radio:talking", 3)
function init()
	DecorSetInt(GetPlayerPed(-1), "radio:talking", 0)
	DecorSetInt(GetPlayerPed(-1), "voip:talking", 0)
	DecorSetInt(GetPlayerPed(-1), "voip:mode", 1)

	Citizen.CreateThread(function()
		SendNUIMessage({
			type = "init",
			tsChannelPath = teamspeakChannel,--use "/glgvoice channelpath" in teamspeak channel to get channel path
			tsChannelName = teamspeakChannelName
		})
		while true do
			Wait(refreshRate)
			if(GetGameTimer()-lastPedDataUpdate >= pedDataRefreshRate) then
				DecorSetInt(GetPlayerPed(-1), "voip:mode", localMode)
				DecorSetInt(GetPlayerPed(-1), "voip:clientID", localClientID)
				lastPedDataUpdate = GetGameTimer()
			end
			if(GetGameTimer()-lastPlayerListUpdate >= playerListRefreshRate) then
				playerList = getPlayers()
				lastPlayerListUpdate = GetGameTimer()
			end
			updateUserData()
			sendTSData()
		end
	end)
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(5)
			if(IsControlJustPressed(0, Keys["G"])) then --switch talk mode hotkey
				if(not localMode) then
					localMode = 1
				end
				localMode = localMode + 1
				if(localMode > 3) then
					localMode = 1
				end
				DecorSetInt(GetPlayerPed(-1), "voip:mode", localMode)
				SendNUIMessage({
					type = "updateMode",
					mode = modeNames[localMode]
				})
			end
			if (IsControlJustPressed(0, Keys["CAPS"]))  then --start talking on radio hotkey
				for k, v in pairs(radioChannels) do
					if v.users[tostring(localClientID)] then
						DecorSetInt(GetPlayerPed(-1), "radio:talking", 1)
						SendNUIMessage({
							type = "radioTalkingOn"
						})
					end
				end
			end
			if (IsControlJustReleased(0, Keys["CAPS"])) then --stop talking on radio hotkey
				if(DecorGetInt(GetPlayerPed(-1), "radio:talking") == 1) then
					DecorSetInt(GetPlayerPed(-1), "radio:talking", 0)
					SendNUIMessage({
						type = "radioTalkingOff"
					})
				end
			end
			if exports["fsn_police"]:fsn_PDDuty() or exports["fsn_ems"]:fsn_EMSDuty() then
				-- ADD PD or EMS CHECK to join radio
				if(not IsControlPressed(0, Keys["LEFTSHIFT"]) and IsControlJustPressed(0, Keys["F9"]))then--join/switch radio hotkey
					if(radioChannels["ems"].users[tostring(localClientID)] == 1) then
						TriggerServerEvent("addUserToRadioChannel", "leo", tostring(DecorGetInt(GetPlayerPed(-1), "voip:clientID")))
						TriggerServerEvent("removeUserFromRadioChannel", "ems", tostring(DecorGetInt(GetPlayerPed(-1), "voip:clientID")))
						SendNUIMessage({
							type = "setChannel",
							channel = "leo"
						})
					--[[
					elseif(radioChannels["bcso"].users[tostring(localClientID)] == 1) then
						TriggerServerEvent("addUserToRadioChannel", "shared", tostring(DecorGetInt(GetPlayerPed(-1), "voip:clientID")))
						TriggerServerEvent("removeUserFromRadioChannel", "bcso", tostring(DecorGetInt(GetPlayerPed(-1), "voip:clientID")))
						SendNUIMessage({
							type = "setChannel",
							channel = "shared"
						})
					elseif(radioChannels["shared"].users[tostring(localClientID)] == 1) then
						TriggerServerEvent("addUserToRadioChannel", "ems", tostring(DecorGetInt(GetPlayerPed(-1), "voip:clientID")))
						TriggerServerEvent("removeUserFromRadioChannel", "shared", tostring(DecorGetInt(GetPlayerPed(-1), "voip:clientID")))
						SendNUIMessage({
							type = "setChannel",
							channel = "ems"
						})
					elseif(radioChannels["ems"].users[tostring(localClientID)] == 1) then
						TriggerServerEvent("addUserToRadioChannel", "lspd", tostring(DecorGetInt(GetPlayerPed(-1), "voip:clientID")))
						TriggerServerEvent("removeUserFromRadioChannel", "ems", tostring(DecorGetInt(GetPlayerPed(-1), "voip:clientID")))
						SendNUIMessage({
							type = "setChannel",
							channel = "lspd"
						})
					]]
					else
						TriggerServerEvent("addUserToRadioChannel", "ems", tostring(DecorGetInt(GetPlayerPed(-1), "voip:clientID")))
						TriggerServerEvent("removeUserFromRadioChannel", "leo", tostring(DecorGetInt(GetPlayerPed(-1), "voip:clientID")))
						SendNUIMessage({
							type = "setChannel",
							channel = "ems"
						})
					end
				elseif(IsControlPressed(0, Keys["LEFTSHIFT"]) and IsControlJustPressed(0, Keys["F9"])) then --leave radios hotkey
					if(radioChannels["leo"].users[tostring(localClientID)] == 1) then
						TriggerServerEvent("removeUserFromRadioChannel", "leo", tostring(DecorGetInt(GetPlayerPed(-1), "voip:clientID")))
					end
					--[[
					if(radioChannels["bcso"].users[tostring(localClientID)] == 1) then
						TriggerServerEvent("removeUserFromRadioChannel", "bcso", tostring(DecorGetInt(GetPlayerPed(-1), "voip:clientID")))
					end
					if(radioChannels["shared"].users[tostring(localClientID)] == 1) then
						TriggerServerEvent("removeUserFromRadioChannel", "shared", tostring(DecorGetInt(GetPlayerPed(-1), "voip:clientID")))
					end
					]]
					if(radioChannels["ems"].users[tostring(localClientID)] == 1) then
						TriggerServerEvent("removeUserFromRadioChannel", "ems", tostring(DecorGetInt(GetPlayerPed(-1), "voip:clientID")))
					end
					SendNUIMessage({
						type = "removeChannel"
					})
				end
			end
		end
	end)
end

function updateUserData()
	userData = {}
	for i = 1, #playerList do
		local player = playerList[i]
		local playerPed = GetPlayerPed(player)
		if(playerPed and GetPlayerPed(-1)) then
			local myPos = GetEntityCoords(GetPlayerPed(-1))
			local playerPos = GetEntityCoords(playerPed)
			local distance = GetDistanceBetweenCoords(myPos, playerPos, true)
			local playerMode = tonumber(DecorGetInt(playerPed,"voip:mode"))
			if(not(playerMode >= 1)) then playerMode = 3 end
			local volume = -30 + (30 - distance / talkDistance[playerMode] * 30)
			if(volume >= 0) then volume = 0 end
			if(DecorExistOn(playerPed, "voip:clientID") and DecorGetInt(playerPed, "voip:clientID") ~= -1) then
				userData[i]={
					clientID = DecorGetInt(playerPed, "voip:clientID"),
					volume = -30,
					muted = 1
				}
			else
				userData[i]={
					clientID = -1,
					volume = -30,
					muted = 1
				}
			end
			if (distance >= talkDistance[playerMode]) then
				userData[i].muted = 1
			else
				userData[i].volume = volume
				userData[i].muted = 0
			end
			local playerRadioTalking = DecorGetInt(playerPed, "radio:talking")
			for k,v in pairs(radioChannels) do
				local channel = radioChannels[k]
				if(channel.users[tostring(localClientID)] == 1 and channel.users[tostring(userData[i].clientID)] == 1 and playerRadioTalking == 1) then
					userData[i].volume = 0
					userData[i].muted = 0
				end
			end
		end
	end
end

function sendTSData()
	local sendString = "updateUserData"
	for k,v in pairs(userData) do
		if(userData[k].clientID ~= -1 and userData[k].clientID ~= DecorGetInt(PlayerPedId(), "voip:clientID")) then
			sendString = sendString .. "\0" .. userData[k].clientID .. "\0" .. userData[k].volume .. "\0" .. userData[k].muted
		end
	end
	SendNUIMessage({
		type = "updateUserData",
		data = sendString
	})
end

function sendTSDuty(state)--used for setting an on duty tag
	if(state == 1) then
		SendNUIMessage({
			type = "setOnDuty"
		})
	else
		SendNUIMessage({
			type = "setOffDuty"
		})
	end
end

AddEventHandler("voip:setOnDuty", sendTSDuty)

RegisterNUICallback("setClientID", function(data)
	localClientID = tonumber(data.id)
	DecorSetInt(GetPlayerPed(-1), "voip:clientID", localClientID)
end)

RegisterNUICallback("setTalking", function(data)
		local state = tonumber(data.state)
		DecorSetInt(GetPlayerPed(-1), "voip:talking", state)
		if(state == 1) then
			RequestAnimDict("mp_facial")
			while not HasAnimDictLoaded("mp_facial") do
				Wait(5)
			end
			TaskPlayAnim(PlayerPedId(),"mp_facial","mic_chatter", 8.0, 0.0, -1, 32, 0, 0, 0, 0)
		else
			StopAnimTask(PlayerPedId(), 'mp_facial', 'mic_chatter', 10.0)
		end
end)


AddEventHandler("onClientResourceStart", function(resource)
	if (resource == GetCurrentResourceName()) then	--	Initialize the script when this resource is started
		Citizen.CreateThread(function()
			Wait(3000)
			init()
		end)
	end
end)

RegisterNetEvent("updateRadioChannels")
AddEventHandler("updateRadioChannels", function(channels)
	radioChannels = channels
end)

------------------------------------------------ SPECIFIC
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
	if DecorGetInt(GetPlayerPed(-1), "voip:talking") == 1 then
      drawTxt(UI.x + 0.517, UI.y + 1.434, 1.0,1.0,0.4, modeNames[DecorGetInt(GetPlayerPed(-1), "voip:mode")], 66, 220, 244, 255)
    else
      drawTxt(UI.x + 0.517, UI.y + 1.434, 1.0,1.0,0.4, modeNames[DecorGetInt(GetPlayerPed(-1), "voip:mode")], 255, 255, 255, 255)
    end
	for k, v in pairs(radioChannels) do
		if v.users[tostring(localClientID)] then
			if DecorGetInt(GetPlayerPed(-1), "radio:talking") == 1 then
				drawTxt(UI.x + 0.517, UI.y + 1.409, 1.0,1.0,0.4, v.name, 66, 220, 244, 255)
			else
				drawTxt(UI.x + 0.517, UI.y + 1.409, 1.0,1.0,0.4, v.name, 255, 255, 255, 255)
			end
		end
	end
  end
end)
