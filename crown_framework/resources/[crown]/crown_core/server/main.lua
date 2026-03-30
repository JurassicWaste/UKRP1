Crown = Crown or {}
Crown.Players = Crown.Players or {}

local function debugPrint(msg)
    if CrownConfig.Debug then
        print(('[CROWN] %s'):format(msg))
    end
end

local function getJobData(jobName, grade)
    local job = CrownJobs[jobName] or CrownJobs.unemployed
    local gradeData = job.grades[grade] or job.grades[0]

    return {
        name = jobName,
        label = job.label,
        grade = grade,
        key = gradeData.key,
        title = gradeData.title,
        salary = gradeData.salary,
        permissions = CrownUtils.DeepCopy(gradeData.permissions or {})
    }
end

local function createDefaultPlayer(src)
    return {
        source = src,
        license = CrownUtils.GetIdentifier(src, 'license:'),
        citizenId = CrownUtils.GenerateCitizenId(),
        charinfo = {
            firstName = 'John',
            lastName = 'Smith'
        },
        money = {
            cash = CrownConfig.StartCash,
            bank = CrownConfig.StartBank
        },
        job = getJobData(CrownConfig.DefaultJob.name, CrownConfig.DefaultJob.grade),
        metadata = {}
    }
end

function Crown.GetPlayer(src)
    return Crown.Players[src]
end

function Crown.GetPlayerByCitizenId(citizenId)
    for _, player in pairs(Crown.Players) do
        if player.citizenId == citizenId then
            return player
        end
    end
    return nil
end

function Crown.HasPermission(src, permission)
    local player = Crown.GetPlayer(src)
    if not player or not player.job then return false end
    return player.job.permissions[permission] == true
end

function Crown.SetJob(src, jobName, grade)
    local player = Crown.GetPlayer(src)
    if not player then return false end
    player.job = getJobData(jobName, grade)
    TriggerClientEvent('crown:client:updateJob', src, player.job)
    return true
end

exports('GetPlayer', Crown.GetPlayer)
exports('GetPlayerByCitizenId', Crown.GetPlayerByCitizenId)
exports('HasPermission', Crown.HasPermission)
exports('SetJob', Crown.SetJob)

AddEventHandler('playerDropped', function()
    Crown.Players[source] = nil
end)

RegisterNetEvent('crown:server:playerReady', function()
    local src = source
    Crown.Players[src] = createDefaultPlayer(src)
    TriggerClientEvent('crown:client:setPlayerData', src, Crown.Players[src])
    debugPrint(('Player %s loaded into Crown core'):format(src))
end)

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end
    math.randomseed(os.time())
    debugPrint('crown_core started')
end)
