local positions = {
  [1] = {
    pos = {x = 112.29388427734, y = -1305.138671875, z = 29.269525527954},
    sitpos = {x = 112.76410675049, y = -1305.7038574219, z = 29.269525527954, h = 21.393161773682},
    dancerpos = {
      front = {x = 112.32679748535, y = -1305.0974121094, z = 29.269533157349, h = 200.47219848633},
      back = {x = 112.40575408936, y = -1305.1303710938, z = 29.269533157349, h = 26.611642837524},
    },
    inuse = false
  }
}

Citizen.CreateThread(function()
  while true do 
    local bleep = AddBlipForCoord(115.66896057129, -1296.7384033203, 29.269014358521)
		SetBlipSprite(bleep, 121)
		SetBlipScale(bleep, 0.8)
		SetBlipAsShortRange(bleep, true)
		BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("Strip Club")
		EndTextCommandSetBlipName(bleep)

    Citizen.Wait(0)
    for k, v in pairs(positions) do
      if GetDistanceBetweenCoords(v.pos.x, v.pos.y, v.pos.z, GetEntityCoords(GetPlayerPed(-1)), true) < 5 then

      end
    end
  end
end)
