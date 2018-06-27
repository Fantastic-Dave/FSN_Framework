RegisterNetEvent('fsn_progress:addBar')
AddEventHandler('fsn_progress:addBar', function(title, time)
  SendNUIMessage({
    type = 'progressBar',
    enable = true,
    timeout = time,
    title = title
  })
end)

RegisterNetEvent('fsn_progress:removeBar')
AddEventHandler('fsn_progress:removeBar', function()
  SendNUIMessage({
    type = 'progressBar',
    enable = false,
    timeout = 0,
    title = 'undefined'
  })
end)
