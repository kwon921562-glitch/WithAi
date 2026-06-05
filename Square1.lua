--1303 숫자사각형1
--[[local num = 1

local function square(n, m)
    for i = 1, n do
        for j = 1, m do
            io.write(num .. " ")
            num = num + 1
        end
        io.write("\n")
    end
end

square (5, 4) ]]--

--1856 숫자사각형2

--[[local num = 1

local function zigzag(n, m)
    for i = 1, n do
        if i%2 == 1 then
            for col = 1, m do
                io.write(num)

                if col < m then
                    io.write(" ")
                end
                
                num = num + 1
            end
            io.write("\n")
        else
            local a = {}

            for o = 1, m do
                a[o] = num
                num = num + 1
            end

            for j = m, 1, -1 do
                io.write(a[j])
                
                if j > 1 then
                    io.write(" ")
                end
            end
            io.write("\n")
        end
    end 
end 

zigzag(4, 6) ]]--

--1304 숫자사각형3

--[[local num = 1
local arr = {}

local function sero (n)
    for i = 1, n do
        arr[i] = {}
    end

    for i = 1, n do
        for j = 1, n do
            arr[j][i] = num
            num = num + 1
        end
    end
    for i = 1, n do
        for j = 1, n do
            io.write(arr[i][j])
            if j < n then
                io.write(" ")
            end
        end
        io.write("\n")
    end

end

sero(6) --]]

--5931 숫자사각형4-1

--[[local num = 1

local function loop(n)
    for j = 1, n do
        for i = 1, n do
            io.write(num)
            io.write(" ")
        end
        num = num + 1
        io.write ("\n")
    end
end

loop(6) --]]

--5932 숫자사각형4-2
--[[local function back(n)
    for i = 1, n do
        if i % 2 == 1 then
            for i = 1, n do
                io.write(i)
                io.write(" ")
            end
        else
            for i = n, 1, -1 do
                io.write(i)
                io.write(" ")
            end
        end
        io.write("\n")
    end
end

back(4) --]]

--5933 숫자사각형4-3
local n = tonumber(io.read())

for i = 1, n do
    for j = 1, n do
        io.write(i * j)

        if j < n then
            io.write(" ")
        end
    end
    io.write("\n")
end

--1307 문자사각형1
local n = tonumber(io.read())

local arr = {}

for i = 1, n do
    arr[i] = {}
end

local num = 0

for col = n, 1, -1 do
    for row = n, 1, -1 do
        arr[row][col] = string.char(65 + (num % 26))
        num = num + 1
    end
end

for i = 1, n do
    for j = 1, n do
        io.write(arr[i][j])

        if j < n then
            io.write(" ")
        end
    end
    io.write("\n")
end

--1314 문자사각형2
local n = tonumber(io.read())

local arr = {}

for i = 1, n do
    arr[i] = {}
end

local count = 0

for col = 1, n do
    if col % 2 == 1 then
        for row = 1, n do
            arr[row][col] = string.char(65 + (count % 26))
            count = count + 1
        end
    else
        -- 짝수 번째 열: 아래에서 위로
        for row = n, 1, -1 do
            arr[row][col] = string.char(65 + (count % 26))
            count = count + 1
        end
    end
end

for i = 1, n do
    for j = 1, n do
        io.write(arr[i][j])

        if j < n then
            io.write(" ")
        end
    end
    io.write("\n")
end

--1338 문자삼각형1
local n = tonumber(io.read())

local arr = {}

for i = 1, n do
    arr[i] = {}
end

local count = 0

for start = 1, n do
    for row = start, n do
        local col = start
        arr[row][col] = string.char(65 + (count % 26))
        count = count + 1
    end
end

for i = 1, n do
    io.write(string.rep(" ", (n - i) * 2))

    for j = 1, i do
        io.write(arr[i][j])

        if j < i then
            io.write(" ")
        end
    end

    io.write("\n")
end

--1339 문자삼각형2
local n = tonumber(io.read())

if n < 1 or n > 100 or n % 2 == 0 then
    print("INPUT ERROR")
else
    local arr = {}

    for i = 1, n do
        arr[i] = {}
    end

    local mid = math.floor(n / 2) + 1
    local count = 0

    for col = mid, 1, -1 do
        for row = col, n - col + 1 do
            arr[row][col] = string.char(65 + (count % 26))
            count = count + 1
        end
    end

    for row = 1, n do
        local first = true

        for col = 1, mid do
            if arr[row][col] ~= nil then
                if not first then
                    io.write(" ")
                end

                io.write(arr[row][col])
                first = false
            end
        end

        io.write("\n")
    end
end

