--[[04.1
local wave = 3
local x, y = 12.5, -8.3
local hp = 100

print(string.format("[Wave %02d] Enemy spawned at (%.2f, %.2f) — HP: %d", wave, x, y, hp)) --]]

--[[04.2
local text = "Background: #FF0000, Text: #00FF00, Border: #0000FF"
for text in string.gmatch(text, "#%x%x%x%x%x%x") do
    print(text)
end ]]--

--[[04.3
local parts = {}
for i = 1, 100 do
    parts[i] = tostring(i)
end
local result = table.concat(parts, ",")
print(result) --]]

--[[04.4
local text = "Player[Lv.15] HP:80/100"

local name, level, currentHP, maxHP = string.match(text, "(%w+)%[Lv%.(%d+)%] HP:(%d+)/(%d+)")

print("이름:", name)
print("레벨:", level)
print("현재HP:", currentHP)
print("최대HP:", maxHP) --]]