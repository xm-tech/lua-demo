local function add(a, b)
	assert(type(a) == "number", "a is not a number")
	assert(type(b) == "number", "b is not a number")
	return a + b
end

-- add(3)
local c = add(3, 5)
print("add(3, 5)=" .. c)

local function mul(a, b)
	if(type(a) ~= "number") then
		error("a is not number", 2)
	end
	if type(b) ~= "number" then
		error("b is not number", 2)
	end
	return a * b
end

local d = mul("lua", 2)
print("mul(2,8)=" .. d)
