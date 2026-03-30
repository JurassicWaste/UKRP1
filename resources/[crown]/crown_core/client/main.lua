local CrownPlayer = nil
local CrownCallbacks = {}
local CurrentRequestId = 0

RegisterNetEvent('crown:client:setPlayerData', function(playerData)
    CrownPlayer = playerData
end)

RegisterNetEvent('crown:client:updateJob', function(job)
    if CrownPlayer then
        CrownPlayer.job = job
    end
end)

RegisterNetEvent('crown:client:callback:response', function(requestId, ...)
    if CrownCallbacks[requestId] then
        CrownCallbacks[requestId](...)
        CrownCallbacks[requestId] = nil
    end
end)

function TriggerServerCallback(name, cb, ...)
    CurrentRequestId = CurrentRequestId + 1
    CrownCallbacks[CurrentRequestId] = cb
    TriggerServerEvent('crown:server:callback:request', name, CurrentRequestId, ...)
end

exports('GetPlayerData', function()
    return CrownPlayer
end)

CreateThread(function()
    while not NetworkIsSessionStarted() do
        Wait(500)
    end
    TriggerServerEvent('crown:server:playerReady')
end)
