--[[05.1
local function getPlayerInfo()
    local x = 100
    local y = 200
    local angle = 90

    return x, y, angle
end

local x, y, angle = getPlayerInfo()

print("x:", x)
print("y:", y)
print("angle:", angle) ]]--

--[[05.2
local function map(number, func)
    local result = {}
    for i = 1, #number do
        result[i] = func(number[i])
    end 
    return result
    
end

local numbers = {1, 2, 3, 4, 5}
local doubled = map(numbers, function(x) return x * 2 end)

for i = 1, #doubled do
    print(doubled[i])
end ]]--

--[[05.3
local function makeHealthBar(maxHp)
    local hp = maxHp

    local healthBar = {}

    function healthBar.damage(amount)
        hp = hp - amount

        if hp < 0 then
            hp = 0
        end
    end

    function healthBar.heal(amount)
        hp = hp + amount

        if hp > maxHp then
            hp = maxHp
        end
    end

    function healthBar.getPercent()
        return hp / maxHp * 100
    end

    return healthBar
end

local playerHp = makeHealthBar(100)

playerHp.damage(30)
print(playerHp.getPercent())

playerHp.heal(20)
print(playerHp.getPercent())

playerHp.damage(200)
print(playerHp.getPercent())

playerHp.heal(999)
print(playerHp.getPercent()) --]]

--[[05.4
local enemy = {hp = 100, name = "Goblin"}

function enemy:takeDamage(amount)
    self.hp = self.hp - amount
    if self.hp <= 0 then
        print(self.name .. " is dead!")
    end
end

enemy:takeDamage(30) --]]