--5934 별삼각형2
local n = tonumber(io.read())

if n < 1 or n > 100 or n % 2 == 0 then
    print("INPUT ERROR!")
else
    local mid = math.floor(n / 2) + 1

    for i = 1, n do
        local space
        local star

        if i <= mid then
            space = i - 1
            star = mid - i + 1
        else
            space = mid - 1
            star = i - mid + 1
        end

        io.write(string.rep(" ", space))
        io.write(string.rep("*", star))
        io.write("\n")
    end
end

--1329 별삼각형3
local n = tonumber(io.read())

if n < 1 or n > 100 or n % 2 == 0 then
    print("INPUT ERROR!")
else
    local mid = math.floor(n / 2) + 1

    for i = 1, n do
        local space
        local star

        if i <= mid then
            space = i - 1
            star = i * 2 - 1
        else
            space = n - i
            star = (n - i) * 2 + 1
        end

        io.write(string.rep(" ", space))
        io.write(string.rep("*", star))
        io.write("\n")
    end
end

--5945 숫자 삼각형1
local n = tonumber(io.read())

if n < 1 or n > 50 or n % 2 == 0 then
    print("INPUT ERROR!")
else
    local num = 1

    for i = 1, n do
        local line = {}

        for j = 1, i do
            line[j] = num
            num = num + 1
        end

        if i % 2 == 1 then
            for j = 1, i do
                io.write(line[j])

                if j < i then
                    io.write(" ")
                end
            end
        else
            for j = i, 1, -1 do
                io.write(line[j])

                if j > 1 then
                    io.write(" ")
                end
            end
        end

        io.write("\n")
    end
end


--5946 숫자 삼각형2
local n = tonumber(io.read())

if n < 1 or n > 50 or n % 2 == 0 then
    print("INPUT ERROR!")
else
    for i = 0, n - 1 do
        local count = 2 * (n - i) - 1

        io.write(string.rep(" ", i * 2))

        for j = 1, count do
            io.write(i)

            if j < count then
                io.write(" ")
            end
        end

        io.write("\n")
    end
end

--5947 숫자 삼각형3
local n = tonumber(io.read())

if n < 1 or n > 50 or n % 2 == 0 then
    print("INPUT ERROR!")
else
    local mid = math.floor(n / 2) + 1

    for i = 1, n do
        local count

        if i <= mid then
            count = i
        else
            count = n - i + 1
        end

        for j = 1, count do
            io.write(j)

            if j < count then
                io.write(" ")
            end
        end

        io.write("\n")
    end
end

--1707 달팽이사각형
local n = tonumber(io.read())

local arr = {}

for i = 1, n do
    arr[i] = {}
end

local top = 1
local bottom = n
local left = 1
local right = n

local num = 1

while num <= n * n do
    for col = left, right do
        arr[top][col] = num
        num = num + 1
    end
    top = top + 1

    for row = top, bottom do
        arr[row][right] = num
        num = num + 1
    end
    right = right - 1

    for col = right, left, -1 do
        arr[bottom][col] = num
        num = num + 1
    end
    bottom = bottom - 1

    for row = bottom, top, -1 do
        arr[row][left] = num
        num = num + 1
    end
    left = left + 1
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

--1337 달팽이삼각형
local n = tonumber(io.read())

local arr = {}

for i = 1, n do
    arr[i] = {}
end

local total = n * (n + 1) / 2

-- 방향: 오른쪽 아래, 왼쪽, 위쪽
local dr = {1, 0, -1}
local dc = {1, -1, 0}

local row = 1
local col = 1
local dir = 1
local num = 0

for count = 1, total do
    arr[row][col] = num % 10
    num = num + 1

    local nextRow = row + dr[dir]
    local nextCol = col + dc[dir]

    -- 다음 칸이 삼각형 범위를 벗어나거나 이미 채워진 칸이면 방향 바꾸기
    if nextRow < 1 or nextRow > n or nextCol < 1 or nextCol > nextRow or arr[nextRow][nextCol] ~= nil then
        dir = dir + 1

        if dir > 3 then
            dir = 1
        end

        nextRow = row + dr[dir]
        nextCol = col + dc[dir]
    end

    row = nextRow
    col = nextCol
end

for i = 1, n do
    for j = 1, i do
        io.write(arr[i][j])

        if j < i then
            io.write(" ")
        end
    end
    io.write("\n")
end

--2071 파스칼 삼각형
local n, m = io.read("*n", "*n")

local arr = {}

for i = 1, n do
    arr[i] = {}

    for j = 1, n do
        arr[i][j] = 0
    end
end

for i = 1, n do
    for j = 1, i do
        if j == 1 or j == i then
            arr[i][j] = 1
        else
            arr[i][j] = arr[i - 1][j - 1] + arr[i - 1][j]
        end
    end
end

if m == 1 then
    for i = 1, n do
        for j = 1, i do
            io.write(arr[i][j])

            if j < i then
                io.write(" ")
            end
        end
        io.write("\n")
    end

elseif m == 2 then
    for i = n, 1, -1 do
        io.write(string.rep(" ", n - i))

        for j = 1, i do
            io.write(arr[i][j])

            if j < i then
                io.write(" ")
            end
        end
        io.write("\n")
    end

elseif m == 3 then
    for i = 1, n do
        for j = 1, i do
            io.write(arr[n - j + 1][n - i + 1])

            if j < i then
                io.write(" ")
            end
        end
        io.write("\n")
    end
end

--1331 문자마름모
local n = tonumber(io.read())

local size = 2 * n - 1
local arr = {}

for i = 1, size do
    arr[i] = {}
end

local count = 0

local function nextChar()
    local ch = string.char(65 + (count % 26))
    count = count + 1
    return ch
end

for layer = 0, n - 1 do
    local len = n - layer

    local row = 1 + layer
    local col = n

    if len == 1 then
        arr[row][col] = nextChar()
    else
        arr[row][col] = nextChar()


        for i = 1, len - 1 do
            row = row + 1
            col = col - 1
            arr[row][col] = nextChar()
        end

        -- 오른쪽 아래 방향
        for i = 1, len - 1 do
            row = row + 1
            col = col + 1
            arr[row][col] = nextChar()
        end

        -- 오른쪽 위 방향
        for i = 1, len - 1 do
            row = row - 1
            col = col + 1
            arr[row][col] = nextChar()
        end

        for i = 1, len - 2 do
            row = row - 1
            col = col - 1
            arr[row][col] = nextChar()
        end
    end
end

for i = 1, size do
    for j = 1, size do
        if arr[i][j] ~= nil then
            io.write(arr[i][j])
        else
            io.write(" ")
        end

        if j < size then
            io.write(" ")
        end
    end
    io.write("\n")
end

--1495 대각선 지그재그
local n = tonumber(io.read())

local arr = {}

for i = 1, n do
    arr[i] = {}
end

local num = 1

for d = 1, 2 * n - 1 do
    local startRow = math.max(1, d - n + 1)
    local endRow = math.min(n, d)

    if d % 2 == 1 then
        for row = startRow, endRow do
            local col = d - row + 1
            arr[row][col] = num
            num = num + 1
        end
    else
        for row = endRow, startRow, -1 do
            local col = d - row + 1
            arr[row][col] = num
            num = num + 1
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

--2074 홀수 마방진
local n = tonumber(io.read())

local arr = {}

for i = 1, n do
    arr[i] = {}
end

local row = 1
local col = math.floor(n / 2) + 1

for num = 1, n * n do
    arr[row][col] = num

    if num % n == 0 then
        row = row + 1

        if row > n then
            row = 1
        end
    else
        row = row - 1
        col = col - 1

        if row < 1 then
            row = n
        end

        if col < 1 then
            col = n
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

