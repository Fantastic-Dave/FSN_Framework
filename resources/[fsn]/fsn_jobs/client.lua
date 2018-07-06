curjob = 'Unemployed'

function fsn_GetJob()
  return curjob
end

function fsn_SetJob(job)
  curjob = job
end

RegisterNetEvent('fsn_jobs:quit')
AddEventHandler('fsn_jobs:quit', function()
  curjob = 'Unemployed'
end)

current_time = 0
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1000)
    current_time = current_time + 1
  end
end)
