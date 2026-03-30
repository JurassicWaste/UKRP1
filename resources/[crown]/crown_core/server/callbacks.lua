local RegisteredCallbacks = {}

function RegisterServerCallback(name, cb)
    RegisteredCallbacks[name] = cb
end

RegisterNetEvent('crown:server:callback:request', function(name, requestId, ...)
    local src = source
    local handler = RegisteredCallbacks[name]
    if not handler then
        TriggerClientEvent('crown:client:callback:response', src, requestId, nil)
        return
    end

    handler(src, function(...)
        TriggerClientEvent('crown:client:callback:response', src, requestId, ...)
    end, ...)
end)

RegisterServerCallback('crown:getPlayerData', function(src, cb)
    cb(Crown.Players[src])
end)
