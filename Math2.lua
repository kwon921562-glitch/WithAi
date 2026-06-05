--1009각 자리수의 역과 합
while true do
    local n = tonumber(io.read())

    if n == 0 then
        break
    end

    local temp = n
    local reverse = 0
    local sum = 0

    while temp > 0 do
        local digit = temp % 10

        reverse = reverse * 10 + digit
        sum = sum + digit

        temp = math.floor(temp / 10)
    end

    print(reverse .. " " .. sum)
end

--2811소수와 합성수
local function isPrime(n)
    if n == 1 then
        return false
    end

    for i = 2, math.floor(math.sqrt(n)) do
        if n % i == 0 then
            return false
        end
    end

    return true
end

for i = 1, 5 do
    local n = io.read("*n")

    if n == 1 then
        print("number one")
    elseif isPrime(n) then
        print("prime number")
    else
        print("composite number")
    end
end

--1901소수 구하기
local function isPrime(num)
    if num < 2 then
        return false
    end

    for i = 2, math.floor(math.sqrt(num)) do
        if num % i == 0 then
            return false
        end
    end

    return true
end

local n = tonumber(io.read())

for i = 1, n do
    local m = tonumber(io.read())

    local down = m
    local up = m

    while down >= 2 and not isPrime(down) do
        down = down - 1
    end

    while up <= 1000000 and not isPrime(up) do
        up = up + 1
    end

    local hasDown = down >= 2
    local hasUp = up <= 1000000

    if hasDown and hasUp then
        local downDiff = m - down
        local upDiff = up - m

        if downDiff < upDiff then
            print(down)
        elseif upDiff < downDiff then
            print(up)
        else
            if down == up then
                print(down)
            else
                print(down .. " " .. up)
            end
        end
    elseif hasDown then
        print(down)
    elseif hasUp then
        print(up)
    end
end

--1740소수
local m = tonumber(io.read())
local n = tonumber(io.read())

local function isPrime(num)
    if num < 2 then
        return false
    end

    for i = 2, math.floor(math.sqrt(num)) do
        if num % i == 0 then
            return false
        end
    end

    return true
end

local sum = 0
local minPrime = nil

for i = m, n do
    if isPrime(i) then
        sum = sum + i

        if minPrime == nil then
            minPrime = i
        end
    end
end

if minPrime == nil then
    print(-1)
else
    print(sum)
    print(minPrime)
end

--2813소수의 개수
local M, N = io.read("*n", "*n")

local function makeBasePrimes(limit)
    local comp = {}
    local primes = {}

    for i = 3, limit, 2 do
        if not comp[i] then
            table.insert(primes, i)

            if i * i <= limit then
                for j = i * i, limit, i * 2 do
                    comp[j] = true
                end
            end
        end
    end

    return primes
end

local limit = math.floor(math.sqrt(N))
local primes = makeBasePrimes(limit)

local count = 0

-- 2는 유일한 짝수 소수라서 따로 처리
if M <= 2 and N >= 2 then
    count = count + 1
end

-- 홀수만 검사
local low = M

if low < 3 then
    low = 3
end

if low % 2 == 0 then
    low = low + 1
end

local blockSize = 100000 -- 홀수 100000개씩 검사

while low <= N do
    local high = low + (blockSize - 1) * 2

    if high > N then
        high = N
    end

    if high % 2 == 0 then
        high = high - 1
    end

    local len = math.floor((high - low) / 2) + 1
    local marked = {}
    local markedCount = 0

    for _, p in ipairs(primes) do
        local start = math.floor((low + p - 1) / p) * p

        if start < p * p then
            start = p * p
        end

        if start % 2 == 0 then
            start = start + p
        end

        for x = start, high, p * 2 do
            local idx = math.floor((x - low) / 2) + 1

            if not marked[idx] then
                marked[idx] = true
                markedCount = markedCount + 1
            end
        end
    end

    count = count + (len - markedCount)

    low = high + 2
end

print(count)

--2814이진수
local s = io.read()

local result = 0

for i = 1, #s do
    local ch = string.sub(s, i, i)
    local digit = tonumber(ch)

    result = result * 2 + digit
end

print(result)


--153410진수를 2, 8, 16진수로
local n, b = io.read("*n", "*n")

local digits = "0123456789ABCDEF"
local result = {}

while n > 0 do
    local remain = n % b
    local ch = string.sub(digits, remain + 1, remain + 1)

    table.insert(result, ch)

    n = math.floor(n / b)
end

for i = #result, 1, -1 do
    io.write(result[i])
end

io.write("\n")

--3106진법 변환
local input = io.read("*a")
local tokens = {}

for word in string.gmatch(input, "%S+") do
    table.insert(tokens, word)
end

local digitChars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"

local function charToValue(ch)
    local byte = string.byte(ch)

    if byte >= string.byte("0") and byte <= string.byte("9") then
        return byte - string.byte("0")
    else
        return byte - string.byte("A") + 10
    end
end

local function valueToChar(value)
    return string.sub(digitChars, value + 1, value + 1)
end

local function convertBase(a, s, b)
    if s == "0" then
        return "0"
    end

    local digits = {}

    for i = 1, #s do
        local ch = string.sub(s, i, i)
        table.insert(digits, charToValue(ch))
    end

    local result = {}

    while #digits > 0 do
        local quotient = {}
        local carry = 0
        local started = false

        for i = 1, #digits do
            local value = carry * a + digits[i]
            local q = math.floor(value / b)
            carry = value % b

            if q ~= 0 or started then
                table.insert(quotient, q)
                started = true
            end
        end

        table.insert(result, valueToChar(carry))
        digits = quotient
    end

    local answer = {}

    for i = #result, 1, -1 do
        table.insert(answer, result[i])
    end

    return table.concat(answer)
end

local idx = 1

while idx <= #tokens do
    if tokens[idx] == "0" then
        break
    end

    local a = tonumber(tokens[idx])
    local s = tokens[idx + 1]
    local b = tonumber(tokens[idx + 2])

    print(convertBase(a, s, b))

    idx = idx + 3
end

--4977실수의 이진수
local n = tonumber(io.read())

local integerPart = math.floor(n)
local fractionPart = n - integerPart

-- 정수 부분을 2진수로 변환
local binaryInteger = ""

if integerPart == 0 then
    binaryInteger = "0"
else
    while integerPart > 0 do
        local remainder = integerPart % 2
        binaryInteger = tostring(remainder) .. binaryInteger
        integerPart = math.floor(integerPart / 2)
    end
end

-- 소수 부분을 2진수 4자리까지 변환
local binaryFraction = ""

for i = 1, 4 do
    fractionPart = fractionPart * 2

    local bit = math.floor(fractionPart)
    binaryFraction = binaryFraction .. tostring(bit)

    fractionPart = fractionPart - bit
end

print(binaryInteger .. "." .. binaryFraction)