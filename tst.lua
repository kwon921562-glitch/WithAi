local k = require 'kutil'


local t = {10, 20, 30}
print(#t)              -- 3 (배열 길이)
for i,v in ipairs(t) do
   print(i, v)
end

for i=1, #t do
   print(i, t[i])
end

t = {}
t[1] = 1
--t[2] = 2
t[3] = 3
print(#t)              -- 3 (배열 길이)
for i,v in ipairs(t) do
   print(i, v)
end