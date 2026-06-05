--1692곱셉
local a = tonumber(io.read())
local b = tonumber(io.read())

local one = b % 10
local ten = math.floor(b / 10) % 10
local hundred = math.floor(b / 100)

print(a * one)
print(a * ten)
print(a * hundred)
print(a * b)

--숫자의 개수
local a = tonumber(io.read())
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
end

--약수와 배수
local n = tonumber(io.read())

local nums = {}

for i = 1, n do
    nums[i] = io.read("*n")
end

local m = io.read("*n")

local divisorSum = 0
local multipleSum = 0

for i = 1, n do
    local num = nums[i]

    -- num이 m의 약수인지 확인
    if m % num == 0 then
        divisorSum = divisorSum + num
    end

    -- num이 m의 배수인지 확인
    if num % m == 0 then
        multipleSum = multipleSum + num
    end
end

print(divisorSum)
print(multipleSum)

--약수 구하기
local n, k = io.read("*n", "*n")

local count = 0
local answer = 0

for i = 1, n do
    if n % i == 0 then
        count = count + 1

        if count == k then
            answer = i
            break
        end
    end
end

print(answer)

--약수
local n = tonumber(io.read())

local small = {}
local big = {}

for i = 1, math.floor(math.sqrt(n)) do
    if n % i == 0 then
        table.insert(small, i)

        if i ~= n / i then
            table.insert(big, n / i)
        end
    end
end

for i = 1, #small do
    io.write(small[i])

    if i < #small or #big > 0 then
        io.write(" ")
    end
end

for i = #big, 1, -1 do
    io.write(big[i])

    if i > 1 then
        io.write(" ")
    end
end

--1658최대공약수와최소공배수
local a, b = io.read("*n", "*n")

local function gcd(x, y)
    while y ~= 0 do
        local temp = x % y
        x = y
        y = temp
    end

    return x
end

local g = gcd(a, b)
local l = a * b / g

print(g)
print(math.floor(l))

--1002최대공약수, 최소공배수
local n = tonumber(io.read())

local nums = {}

for i = 1, n do
    nums[i] = io.read("*n")
end

local function gcd(a, b)
    while b ~= 0 do
        local temp = a % b
        a = b
        b = temp
    end

    return a
end

local function lcm(a, b)
    return math.floor(a * b / gcd(a, b))
end

local resultGcd = nums[1]
local resultLcm = nums[1]

for i = 2, n do
    resultGcd = gcd(resultGcd, nums[i])
    resultLcm = lcm(resultLcm, nums[i])
end

print(resultGcd .. " " .. resultLcm)

--5545연필공장
local P, V, K = io.read("*n", "*n", "*n")

local function gcd(a, b)
    while b ~= 0 do
        local temp = a % b
        a = b
        b = temp
    end
    return a
end

local function lcm(a, b)
    return a / gcd(a, b) * b
end

local paintFailCycle = P + 1
local glossFailCycle = V + 1

local paintFail = math.floor(K / paintFailCycle)
local glossFail = math.floor(K / glossFailCycle)

local bothFailCycle = lcm(paintFailCycle, glossFailCycle)
local bothFail = math.floor(K / bothFailCycle)

local B = bothFail
local C = glossFail - bothFail
local D = paintFail - bothFail
local A = K - B - C - D

print(string.format("%d %d %d %d", A, B, C, D))