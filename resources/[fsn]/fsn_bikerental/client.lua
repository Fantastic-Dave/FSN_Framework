local guiEnabled = false
local rentalText = true
local returnText = false
local rentalMenuOpen = false

DecorRegister("bikeRental:rented", 3)

  local bikeRentalCoords = { -- Bike Rental Locations/Coords.
    ["Pink Cage Bike Rental"] = { 
      rentalLocation = { ['x'] = 327.61, ['y'] = -205.09, ['z'] = 54.09},
    },
  
    ["Beach/Pier Bike Rental"] = { 
      rentalLocation = { ['x'] = -1223.59, ['y'] = -1496.72, ['z'] = 4.36},
    },
  }

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = GetPlayerPed(-1)
        local playerPos = GetEntityCoords(playerPed, 1)

        for k, v in pairs(bikeRentalCoords) do
            if GetDistanceBetweenCoords(v.rentalLocation.x, v.rentalLocation.y, v.rentalLocation.z, playerPos, 1) <= 2 then
            if not IsPedInAnyVehicle(playerPed, false) then
                if rentalText == true then
               -- Util.DrawText3D(playerPos['x'], playerPos['y'], playerPos['z'] + 0.3, '~r~[E] ~w~Bike Rentals', {255, 255, 255, 255}, 0.25) -- Add this for Live Utils.
               DrawText3D(playerPos['x'], playerPos['y'], playerPos['z'] + 0.3, '~r~[E] ~w~Bike Rentals', {255, 255, 255, 255}, 0.25)
                end
                elseif IsPedInAnyVehicle(playerPed, false) and DecorGetInt(GetVehiclePedIsIn(GetPlayerPed(-1), false), "bikeRental:rented") == 1 then
                -- Util.DrawText3D(playerPos['x'], playerPos['y'], playerPos['z'] + 0.3, '~r~[E] ~w~Return Bike', {255, 255, 255, 255}, 0.25) -- Add this for Live Utils.
                DrawText3D(playerPos['x'], playerPos['y'], playerPos['z'] + 0.3, "~r~[E] ~w~Return Bike", {255, 255, 255, 255}, 0.25)
                rentalText = false
                returnText = true
                else
                    -- Util.DrawText3D(playerPos['x'], playerPos['y'], playerPos['z'] + 0.3, '"Not on a Rented Bike', {255, 255, 255, 255}, 0.25) -- Add this for Live Utils.
                    DrawText3D(playerPos['x'], playerPos['y'], playerPos['z'] + 0.3, "Not on a Rented Bike", {255, 255, 255, 255}, 0.25)
                    rentalText = false
                    returnText = false
            end

            if IsControlJustPressed(1, 38) and rentalText == true then -- [E] Open
                rentalText = false
                
                EnableGui(true)
                SetNuiFocus(true, true)
            end

           if IsControlJustPressed(1, 38) and returnText == true then -- [E] Open
            deleteCar()
            end

            if guiEnabled == false then
                rentalText = true
            end

            end
        end
    end
end)

      -- Vehicle Spawner START --
      function spawnCar(car)
        local car = GetHashKey(car)
    
        RequestModel(car)
        while not HasModelLoaded(car) do
            RequestModel(car)
            Citizen.Wait(0)
        end
    
        local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
        local vehicle = CreateVehicle(car, x, y, z + 1, 0.0, true, false)
        SetEntityAsMissionEntity(vehicle, true, true)
        SetPedIntoVehicle(GetPlayerPed(-1), vehicle, -1) -- Teleport into bike seat.
        DecorSetInt(vehicle, "bikeRental:rented", 1)
    end
    -- Vehicle Spawner END --

    -- Vehicle Delete START --
    function deleteCar()
            if DecorGetInt(GetVehiclePedIsIn(GetPlayerPed(-1), false), "bikeRental:rented") == 1 then -- Check if vehicle is a Rented Bike.
                
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
        SetEntityAsMissionEntity(vehicle, true, true)
        Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(vehicle))
        rentalText = true
        returnText = false
            else
                print("Not a rented bike.")
       end
    end 
    -- Vehicle Delete END --

    ---- 3D TEXT START -- Comment this out for Live ----
    function DrawText3D(x, y, z, text, col, scale)
        local onScreen,_x,_y=World3dToScreen2d(x,y,z)
        local px,py,pz=table.unpack(GetGameplayCamCoords())
        if onScreen then
            SetTextScale(scale,scale)--(0.3, 0.3)
            SetTextFont(0)
            SetTextProportional(1)
            SetTextColour(col[1],col[2],col[3],col[4])--(255, 255, 255, 140)
            SetTextDropshadow(0, 0, 0, 0, 55)
            SetTextEdge(2, 0, 0, 0, 150)
            SetTextDropShadow()
            SetTextOutline()
            SetTextEntry("STRING")
            SetTextCentre(1)
            AddTextComponentString(text)
            DrawText(_x,_y)
        end
      end
      ---- 3D Text END Comment this out for Live ----


      -- NUI STUFF --

      function EnableGui(enable)
        SetNuiFocus(enable)
        guiEnabled = enable
    
        SendNUIMessage({
            type = "enableui",
            enable = enable
        })
    end

      RegisterNUICallback('escape', function(data, cb)
        EnableGui(false)
        SetNuiFocus(false, false)
        rentalText = true
        cb('ok')
    end)

    RegisterNUICallback('rentBike', function(data, cb)
        print("DEBUG: BIKE MODEL="..data.model.." PRICE=$"..data.price)
        spawnCar(data.model)
        -- Take money from ped. Use data.price
        print("Rented "..data.model.." for "..data.price) -- debug, remove if yah want.
        rentalText = true

        EnableGui(false)
        SetNuiFocus(false, false)
        cb('ok')
    end)

      Citizen.CreateThread(function()
        while true do
            if guiEnabled then
                DisableControlAction(0, 1, guiEnabled) -- LookLeftRight
                DisableControlAction(0, 2, guiEnabled) -- LookUpDown
    
                DisableControlAction(0, 142, guiEnabled) -- MeleeAttackAlternate
    
                DisableControlAction(0, 106, guiEnabled) -- VehicleMouseControlOverride
    
                if IsDisabledControlJustReleased(0, 142) then -- MeleeAttackAlternate
                    SendNUIMessage({
                        type = "click"
                    })
                end
            end
            Citizen.Wait(0)
        end
    end)