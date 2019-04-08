function fsn_FindNearbyPed(Distance)
    local TargetPed
    local Handle, Ped = FindFirstPed()
    repeat
        local DistanceBetween = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(Ped), true)
        if DoesEntityExist(Ped) and not IsPedAPlayer(Ped) and DistanceBetween <= Distance then
            TargetPed = Ped
        end

    Success, Ped = FindNextPed(Handle)
    until not Success

    EndFindPed(Handle)
    return TargetPed
end

function fsn_FindPedNearbyCoords(x,y,z,Distance)
    local TargetPed
    local Handle, Ped = FindFirstPed()
    repeat
        local DistanceBetween = GetDistanceBetweenCoords(x,y,z, GetEntityCoords(Ped), true)
        if DoesEntityExist(Ped) and not IsPedAPlayer(Ped) and DistanceBetween <= Distance then
            TargetPed = Ped
        end

    Success, Ped = FindNextPed(Handle)
    until not Success

    EndFindPed(Handle)
    return TargetPed
end