local instances = {}
local inInstance = false
local curInstance = 0
local debug = true
function table.contains(table, element)
  for _, value in pairs(table) do
    if value[1] == element then
      return true
    end
  end
  return false
end
function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
  SetTextFont(font)
  SetTextProportional(0)
  SetTextScale(scale, scale)
  SetTextColour(r, g, b, a)
  SetTextDropShadow(0, 0, 0, 0,255)
  SetTextEdge(1, 0, 0, 0, 255)
  SetTextDropShadow()
  SetTextOutline()
  SetTextCentre(centre)
  SetTextEntry("STRING")
  AddTextComponentString(text)
  DrawText(x , y)
end

RegisterNetEvent('fsn_instancemanager:client:createInstance')
AddEventHandler('fsn_instancemanager:client:createInstance', function()
  TriggerServerEvent('fsn_instancemanager:server:createVisVoice', {script='fsn_instancemanager'})
end)

RegisterNetEvent('fsn_instancemanager:client:updateInstances')
AddEventHandler('fsn_instancemanager:client:updateInstances', function(instable)
  instances = instable
end)

RegisterNetEvent('fsn_instancemanager:client:joinInstance')
AddEventHandler('fsn_instancemanager:client:joinInstance', function(instable, insID)
  inInstance = true
  curInstance = insID
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if inInstance then
      local myInstance = instances[curInstance]
      if debug then
        drawTxt('| :fsn_instancemanager: debug |',4,0,0.005,0.35,0.4,0,255,0,100)
        drawTxt('| ID: #'..curInstance,4,0,0.005,0.375,0.4,0,255,0,100)
        drawTxt('| Owner: #'..instances[curInstance].owner,4,0,0.005,0.40,0.4,0,255,0,100)
        drawTxt('| Type: '..instances[curInstance].type,4,0,0.005,0.425,0.4,0,255,0,100)
        drawTxt('| Voice Channel: '..curInstance,4,0,0.005,0.450,0.4,0,255,0,100)
        drawTxt('| Members: '..table.concat(instances[curInstance].members,', #',1,#instances[curInstance].members),4,0,0.005,0.475,0.4,0,255,0,100)
      end
      NetworkSetVoiceChannel(curInstance)
      for i=1,32 do
        if NetworkIsPlayerActive(i) then
          local plySID = GetPlayerServerId(i)
          if table.contains(myInstance.members, plySID) then
            if myInstance.type == 'VisVoice' then
              SetEntityVisible(GetPlayerPed(i), true, 0)
            end
          else
            if myInstance.type == 'VisVoice' then
              SetEntityVisible(GetPlayerPed(i), false, 0)
            end
          end
        end
      end
    else
      NetworkSetVoiceChannel(0)
      for i=1,32 do
        if NetworkIsPlayerActive(i) then
          for k, v in pairs(instances) do
            if table.contains(v.members, GetPlayerServerId(i)) then
              if v.type == 'VisVoice' then
                SetEntityVisible(GetPlayerPed(i), false, 0)
              end
            else
              SetEntityVisible(GetPlayerPed(i), true, 0)
            end
          end
        end
      end
    end
  end
end)
