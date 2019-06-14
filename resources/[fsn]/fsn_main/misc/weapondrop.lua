local pedindex = {}

function SetWeaponDrops()
    local handle, ped = FindFirstPed()
    local finished = false
    repeat 
        if not IsEntityDead(ped) then
            pedindex[ped] = {}
        end
        finished, ped = FindNextPed(handle)
    until not finished
    EndFindPed(handle)

    for ped,_ in pairs(pedindex) do
        SetPedDropsWeaponsWhenDead(ped, false)
    end
end


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        SetWeaponDrops()
    end
end)