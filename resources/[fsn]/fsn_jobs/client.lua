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
