--[[02.1

print(type(42)) -- number
print(type(42.0))  --number
print(type("42")) --string
print(type(nil)) --nil
print(type(true)) --boolean
print(type(print)) --functions
print(type({})) --table
print(type(type)) --function --]]

--[[02.2
local function createBullet(x, y)
    local speed = 500
    local dx = 0
    local dy = -1
    local bullet = {x = x, y = y, speed = speed, dx = dx, dy = dy}
    return bullet
end ]]--

--[[02.3
local a, b, c = 10, 20, 30
print(a, b, c)
a, c = c, a
print(a, b, c) --]]

--[[02.4
if 0 then print("A") end --true
if "" then print("B") end --true
if nil then print("C") end  --false
if false then print("D") end --false
if 0.0 then print("E") end --true
if "false" then print("F") end --true --]]