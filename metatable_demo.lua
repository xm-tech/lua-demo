-- metatable

local t = {a = 16}

local mt = {
	-- 第1个参数 table 是主表
	__add = function (table, b)
		return table.a + b
	end,

	-- 元方法 可以是 1个 函数
	__index = function (table, key)
		print("key", key)
		table[key] = 11
		-- return table.a * 10
		-- return 12
		return table[key]
	end
	--
	--
	-- 元方法也可以是 1 张表
	-- __index = {
	-- 	ab = 55
	-- }
}

setmetatable(t, mt)

print("t + 1 = ", t + 1) -- will call t.metatable.__add(t, 1)

print("t[ab]=",t['ab'])
