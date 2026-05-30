-- ** 구현 **
-- #12338 구구단 1

--[[local a, b = io.read("*n", "*n")

local function gugudan(a, b)
    local step = 1

    if a > b then
        step = -1
    end

    for i = a, b, step do
        for j = 1, 9 do
            print(string.format("%d * %d = %d", i, j, i * j))
        end

        if i ~= b then
            print()
        end
    end
end

gugudan(a, b) --]]

-- #12422 구구단 2

--[[ local function gguggudan (a, b)
    local step = 1

    if (a > b) then
        step = -1
    end

    for i = a, b, step do
        for j = 1, 9 do
            print(string.format("%d * %d = %d", i, j, i*j))
        end
        print("\n")
    end
end

    while true do
        local a, b = io.read("*n", "*n")

        if a < 2 or a > 9 or b < 2 or b > 9 then
            print("INPUT ERROR!")
        else
            gguggudan(a, b)
        break
    end
end --]]

-- #1341 구구단 3

--[[local a, b = io.read("*n", "*n")

local function gggugggudan (a, b)
    local step = 1

    if (a > b) then
        step = -1
    end

    for i = a, b, step do
        for j = 1, 9 do
            if i*j < 10 then
                io.write(string.format("%d * %d =  %d   ", i, j, i*j))
            else
                io.write(string.format("%d * %d = %d   ", i, j, i*j))
            end
            if j % 3 == 0 then
                print()
            end
        end
        print("\n")
    end
end

gggugggudan (a, b) --]]

--#1291 구구단 4
--[[local function gggguggggudan (a, b)
    local step = 1

    if (a > b) then
        step = -1
    end

    for j = 1, 9 do
        for i = a, b, step do
            io.write(string.format("%d * %d = %2d", i, j, i * j))

            if i ~= b then
                io.write("   ")
            end
        end
        print()
    end
end

    while true do
        local a, b = io.read("*n", "*n")

        if a < 2 or a > 9 or b < 2 or b > 9 then
            print("INPUT ERROR!")
        else
            gggguggggudan(a, b)
        break
    end
end --]]

-- ** 수학 1 **
--#1692 곱셈

--[[ local a = tonumber(io.read())
local b = tonumber(io.read())

local one = b % 10
local ten = math.floor(b / 10) % 10
local hundred = math.floor(b / 100)

print(a * one)
print(a * ten)
print(a * hundred)
print(a * b) --]]

-- #1430 숫자의 개수

--[[local a = tonumber(io.read())
local b = tonumber(io.read())
local c = tonumber(io.read())

local result = a * b * c
local str = tostring(result)

local count = {}

for i = 0, 9 do
    count[i] = 0
end

for i = 1, #str do
    local digit = tonumber(string.sub(str, i, i))
    count[digit] = count[digit] + 1
end

for i = 0, 9 do
    print(count[i])
end --]]

--#1071 약수와 배수

--[[local n = tonumber(io.read())

local nums = {}

for i = 1, n do
    nums[i] = io.read("*n")
end

local m = io.read("*n")

local divisorSum = 0
local multipleSum = 0

for i = 1, n do
    local num = nums[i]

    if m % num == 0 then
        divisorSum = divisorSum + num
    end

    if num % m == 0 then
        multipleSum = multipleSum + num
    end
end

print(divisorSum)
print(multipleSum) --]]

