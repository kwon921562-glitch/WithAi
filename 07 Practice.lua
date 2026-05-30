--[[07.1
local function deepCopy(original, copies)
    copies = copies or {}

    if type(original) ~= "table" then
        return original
    end

    if copies[original] then
        return copies[original]
    end

    local copy = {}

    copies[original] = copy

    for key, value in pairs(original) do
        local copiedKey = deepCopy(key, copies)
        local copiedValue = deepCopy(value, copies)

        copy[copiedKey] = copiedValue
    end

    return copy
end

local a = {value = 1}
a.self = a

local b = deepCopy(a)

print(b.value)    
print(b.self == b)  
print(a == b)  --]]

--[[07.2
local ParticlePool = {
    pool = {},
    active = {},
}

function ParticlePool.get()
    local particle
    local n = #ParticlePool.pool

    if n > 0 then
        particle = ParticlePool.pool[n]
        ParticlePool.pool[n] = nil
    else
        particle = {
            x = 0,
            y = 0,
            vx = 0,
            vy = 0,
            life = 0,
            maxLife = 1,
            active = false
        }
    end

    particle.x = 0
    particle.y = 0
    particle.vx = 0
    particle.vy = 0
    particle.life = 1
    particle.maxLife = 1
    particle.active = true

    ParticlePool.active[#ParticlePool.active + 1] = particle

    return particle
end

function ParticlePool.release(particle)
    particle.active = false
    particle.x = 0
    particle.y = 0
    particle.vx = 0
    particle.vy = 0
    particle.life = 0

    ParticlePool.pool[#ParticlePool.pool + 1] = particle
end

function ParticlePool.updateAll(dt)
    for i = #ParticlePool.active, 1, -1 do
        local p = ParticlePool.active[i]

        p.x = p.x + p.vx * dt
        p.y = p.y + p.vy * dt
        p.life = p.life - dt

        if p.life <= 0 then
            table.remove(ParticlePool.active, i)
            ParticlePool.release(p)
        end
    end
end --]]

--[=[07.3
local function toSet(list)
    local result = {}

    for i = 1, #list do
        result[list[i]] = true
    end

    return result
end

local function union(a, b)
    local result = {}

    for k in pairs(a) do
        result[k] = true
    end

    for k in pairs(b) do
        result[k] = true
    end

    return result
end

local function intersection(a, b)
    local result = {}

    for k in pairs(a) do
        if b[k] then
            result[k] = true
        end
    end

    return result
end

local function difference(a, b)
    local result = {}

    for k in pairs(a) do
        if not b[k] then
            result[k] = true
        end
    end

    return result
end

local function printSet(set)
    for k in pairs(set) do
        print(k)
    end
end

local a = toSet({"fire", "ice", "wind"})
local b = toSet({"ice", "earth", "wind"})

print("union")
printSet(union(a, b))

print("intersection")
printSet(intersection(a, b))

print("difference a-b")
printSet(difference(a, b)) --]=]

local function safeSet(t, value, ...)
    local keys = {...}
    local current = t

    for i = 1, #keys - 1 do
        local key = keys[i]

        if current[key] == nil then
            current[key] = {}
        end

        current = current[key]
    end

    current[keys[#keys]] = value
end

local t = {}

safeSet(t, 100, "player", "stats", "hp")

print(t.player.stats.hp)