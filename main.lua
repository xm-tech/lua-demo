require "common"


local cjson = require "cjson"

------------ var
local a = 5
print("a="..a)
print("type("..a..")="..type(a))
a = 5.5
print("type("..a..")="..type(a))
-- a = nil
print("type("..a..")="..type(a))
a = true
-- print("type("..a..")="..type(a))
a = print
-- print("type("..a..")="..type(a))
print(type(print))
print(type(type(print)))



println()
println()


---------- string

print("hello")
local hello = "hello"
print(hello)
hello = hello:upper()
print(hello)
local name = "maxm"
print(name)
print("name.length=" .. #name)
print("2" + 5)
local name_upper = string.upper(name)
print("string.upper("..name..")="..name_upper)
-- 转换第1，3个字符为数字
local name_upper_sneppet = string.byte(name_upper, 1, 3)
print("name_upper_sneppet="..name_upper_sneppet)

-- 一块字符串
local html = [[
	hello html
	hello html lan
]]
print("html="..html)

-- string replace
local words = "welcome to the lua lua lua world"
print("words="..words)
local words1 = string.gsub(words, "lua", "go")
print("words1="..words1)
-- replace the first lua
local words2 = string.gsub(words, "lua", "go", 1)
print("words2="..words2)
-- replace the 2 head word
local words3 = string.gsub(words, "lua", "go", 2)
print("words3=" .. words3)

local lua_begin, lua_end = string.find(words, "lua")
print("lua_begin=" .. lua_begin .. ", lua_end=" .. lua_end)
local sub = string.sub(words, lua_begin, lua_end)
print("sub=" .. sub)

local format = string.format("welcome to the %s world", "lua")
print("format=" .. format)

-- 转换 words 的第 1 个字符为数字
local first_byte = string.byte(words, 1)
local first_char = string.char(first_byte)
print("first_byte=" .. first_byte .. ",first_char=" .. first_char)

local int_to_char = string.char(66,67,68,69,70)
print("int_to_char=" .. int_to_char)


local a_ = "a"
local b_ = "b"
-- string concat
local c_ = a_ .. b_
print("c_=" .. c_)
print(string.format("c_=%s", "clang"))

local lua = "lua"
local lua3 = string.rep(lua, 3)
print("lua3 = " .. lua3)

println()
println()



----------- table

local girls = {}

local lfj = {}
lfj.sex = 1
lfj.name = "lfj"
girls['lfj'] = lfj
print("lfj.name="..lfj.name.."\nlfj.sex="..lfj.sex)

local tq = {}
tq['name'] = "tq"
tq['sex'] = 1
girls['tq'] = tq
print("tq.name="..tq.name.."\ntq.sex="..tq.sex..",tq['name']="..tq['name'])


print("girls['tq'].name=" .. girls['tq'].name)
print("girls['lfj'].name=" .. girls['lfj'].name)

-- 移除引用，lua垃圾回收会释放内存
lfj = nil
tq = nil

local fruts = {"apple", "pear", "peach"}
print(fruts[1])
for k,v in pairs(fruts) do
	print(k .. "--" .. v)
end

-- table insert
table.insert(fruts, 2, "grape")
table.insert(fruts, "durian")
print("fruts="..table.concat(fruts, "\\"))

-- table remove
print("before remove,fruts="..table.concat(fruts, ","))
-- remove the last element from the table
-- table.remove(fruts)
-- remoe the second element from the table
table.remove(fruts, 2)
print("after remove,fruts="..table.concat(fruts, ","))

-- talbe sort
table.sort(fruts)
print("after sort,fruts="..table.concat(fruts, ","))
local compare = function (c, d)
	return c > d
end
table.sort(fruts,compare)
print("after sort again,fruts="..table.concat(fruts, ","))

-- print("test ipairs")
for idx, val in ipairs(fruts) do
	print("fruts["..idx .."] = " .. val)
end


-- table length
local function gettablelen(tab)
	return #tab
end
print("fruts.length="..gettablelen(fruts))
fruts[30] = "strafirst_charerry"
print("fruts.length="..gettablelen(fruts))

local function gettablelen2(tab)
	local length = 0
	for _, _ in pairs(tab) do
		length = length + 1
	end
	return length
end
print("fruts.length="..gettablelen2(fruts))

local score = {[1]=30, [2]=55, [3]=66, [20]=3}

local function table_max(t)
	local max = nil
	for _, v in pairs(t) do
		assert(type(v) == "number", "v is not a numeric")
		if max == nil then
			max = v
		end
		if v > max then
			max = v
		end
	end
	return max
end

print("table_max(["..table.concat(score, ",").."])="..table_max(score))

local fruit_copy = fruts
fruts = nil
-- will throw error while attempt to index a nil value
-- print("fruts[1]=" .. fruts[1])

print("fruit_copy={" .. table.concat(fruit_copy, ",") .. "}")
fruit_copy = nil


-- metatable
local age = "33"
local int_meta_table = getmetatable(age)
print(int_meta_table)
-- local int_meta_func = rawget(getmetatable(age) or {}, '__index')
-- print("int_meta_func:")

-- cjson.encode(int_meta_table)
--

println()
println()


----------- file

local function file_exists(file)
	local f = io.open(file, "rb")
	if f then f:close() end
	return f ~= nil
end

local function file_read(file)
	if not file_exists(file) then
		return {}
	end

	local lines = {}
	for line in io.lines(file) do
		lines[#lines+1]	 = line
	end
	return lines
end

local fexists = string.format("%s", file_exists("1.json"))
print("file_exists="..fexists)


local lines = file_read("1.json")
print("lines="..table.concat(lines))


-- 引入 1 个模块
local card = require "card"

card.detail()
card.addExp(3)
-- equal to addExp(9)
card.addExp "9"

card.detail()
card.addExp(8)

card.detail()
card.addExp(9)

card.detail()
card.setStarNum(11)
card.detail()

-------------- json
-- encode table to json
local input = { 1, 2, 3, { x = 10  }  }
local json_out = cjson.encode(input)
print("json_out = " .. json_out)
json_out = L_encode(input)
print("json_out = " .. json_out)

-- decode from json str
print(json_out)
local json_decode = cjson.decode(json_out)
json_decode = L_decode(json_out)
print(json_decode[1] .. "," .. json_decode[2])
print(json_decode[4].x)
print(cjson.encode(lines))














