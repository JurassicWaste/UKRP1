CrownUtils = {}

function CrownUtils.DeepCopy(tbl)
    if type(tbl) ~= "table" then return tbl end
    local copy = {}
    for k, v in pairs(tbl) do
        copy[k] = CrownUtils.DeepCopy(v)
    end
    return copy
end

function CrownUtils.GenerateCitizenId()
    local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local id = "CRN"
    for i = 1, 8 do
        local idx = math.random(1, #chars)
        id = id .. chars:sub(idx, idx)
    end
    return id
end

function CrownUtils.GetIdentifier(src, prefix)
    local identifiers = GetPlayerIdentifiers(src)
    for _, identifier in ipairs(identifiers) do
        if identifier:find(prefix, 1, true) == 1 then
            return identifier
        end
    end
    return nil
end
