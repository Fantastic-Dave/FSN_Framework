
-- Remove the reticle
function ManageReticle()
    local ped = GetPlayerPed( -1 )

    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
        if ( GetFollowPedCamViewMode() ~= 4 and IsPlayerFreeAiming() ) then
            HideHudComponentThisFrame( 14 )
        end
        Citizen.Wait( 0 )
    end
    HideHudComponentThisFrame( 14 )
end

Citizen.CreateThread( function()
    while true do
        ManageReticle()
    end
end )

-- fsn_main:gui:money:changeAmount
-- fsn_main:gui:money:addMoney
-- fsn_main:gui:bank:changeAmount
-- fsn_main:gui:bank:addMoney
-- fsn_main:gui:minusMoney
-- fsn_main:gui:bank:minusMoney
-- fsn_main:gui:money:display
-- fsn_main:gui:bank:display


RegisterNetEvent('fsn_main:gui:both:display')
AddEventHandler('fsn_main:gui:both:display', function(money, bank)
  SendNUIMessage({
    type = 'gui',
    display = 'both',
    moneyAmount = money,
    bankAmount = bank
  })
end)

RegisterNetEvent('fsn_main:gui:money:change')
AddEventHandler('fsn_main:gui:money:change', function(money, change)
  SendNUIMessage({
    type = 'gui',
    display = 'moneyChange',
    moneyAmount = money,
    changeAmount = change
  })
end)

RegisterNetEvent('fsn_main:gui:bank:change')
AddEventHandler('fsn_main:gui:bank:change', function(bank, change)
  SendNUIMessage({
    type = 'gui',
    display = 'bankChange',
    bankAmount = bank,
    changeAmount = change
  })
end)
