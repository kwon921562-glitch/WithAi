--[[03.1
local enemyType = "slime"

local speedTable = {
    slime = 50,
    bat = 150,
    boss = 30,
}

local speed = speedTable[enemyType] or 100
print(speed) --]]

--[[03.2
for i = 1, 20 do
    if i % 3 == 0 then
        print(i)
    end
end --]]

--[[03.3
local a = true and false or "fallback" --fallback
--이유는 true and false에서 true는 참이니깐 false를 반환하고 false랑 fallback에서 false가 거짓이니깐 fallback 반환
local b = true and 0 or "fallback" --0
--이유는 true랑 0에서 true가 참이니깐 0를 반환하고 0이랑 fallback에서 0이 참이니깐 0으로 반환
local c = nil and "yes" or "no" --nil
--이유는 nil이랑 yes에서 nil이 거짓이니깐 nil로 반환하고 nil이랑 no에서 nil이 거짓이니깐 no로 반환
print(a, b, c) --]]

--[[03.4
for i = 0, 9 do
    print(i)
end ]]--
