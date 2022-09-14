-- metatable

local t = {a = 1}

local mt = {
	__add = function (table, b)
		return table.a + b
	end,

	__index = function (table, key)
		print("key", key)
		table[key] = 11
		-- return table.a * 10
		-- return 12
		return table[key]
	end
	--
	-- __index = {
	-- 	ab = 55
	-- }
}

setmetatable(t, mt)

print(t + 1) -- will call t.metatable.__add(t, 1)

print(t['ab'])
