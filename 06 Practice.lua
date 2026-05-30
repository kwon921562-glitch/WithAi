--[[06.1
local inventory = {}

local function addItem(inventory, item)
    table.insert(inventory, item)
end

local function removeItem(inventory, index)
    table.remove(inventory, index)
end

local function findItem(inventory, item)
    for i = 1, #inventory do
        if inventory[i] == item then
            return i
        end
    end

    return nil
end

local function printInventory(inventory)
    print("=== Inventory ===")

    for i = 1, #inventory do
        print(i .. ". " .. inventory[i])
    end
end

addItem(inventory, "Sword")
addItem(inventory, "Shield")
addItem(inventory, "Potion")    
printInventory(inventory) --]]

--[[06.2
local leaderboard = {
    {name = "Alice", score = 1500},
    {name = "Bob", score = 2300},
    {name = "Charlie", score = 800},
}

table.sort(leaderboard, function(a, b)
    return a.score > b.score
end)

for i = 1, #leaderboard do
    print(leaderboard[i].name.."("..(leaderboard[i].score)..")")
end --]]

--[[06.3
local a = {1, 2, 3} --3
--1, 2, 3 3개니깐 길이는 3
local b = {1, nil, 3} --결과가 불확실
--가운데 nil이 있으면 구멍이 있는거랑 다름 없어서 구현에 따라 다름 결과가 불확실함
local c = {x = 1, y = 2, z = 3} --0
--딕셔너리 크기는 #으로 구할 수 없다.
print(#a, #b, #c) --]]

--[[06.4
local function swapRemove(t, i)
    local lastIndex = #t

    t[i] = t[lastIndex]
    t[lastIndex] = nil
end

local t = {}

for i = 1, 100 do
    t[i] = i
end

table.remove(t, 50)

--51~100번을 한 칸씩 앞으로 이동
--순서가 유지됨

local t = {}

for i = 1, 100 do
    t[i] = i
end

swapRemove(t, 50)

--100번 값을 50번에 넣고 마지막 삭제
--순서가 유지 안됨 --]]