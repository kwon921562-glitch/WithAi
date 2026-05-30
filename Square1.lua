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

--1307 문자사각형1

--1314 문자사각형2

--1338 문자삼각형1

--1339 문자삼각형2

