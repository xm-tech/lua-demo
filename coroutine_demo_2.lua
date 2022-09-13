function foo(a)
	print("foo,a=", a)
	assert(a == 2 , "a is not 2")
	-- return 2 * a to the caller
	return coroutine.yield(2 * a)
end

local c = coroutine.create(function (a, b)
	print("co.1,a="..a..",b="..b)
	foo(a + 1)
	-- return a+b , a-b to the caller
	local r, s = coroutine.yield(a + b, a - b)
	print("co.2",r,s)
	-- return b, "end" to the caller
	return b, "end"
end)

print("main.1", coroutine.resume(c, 1, 2))
print("main.2", coroutine.resume(c, 10))
print("main.3", coroutine.resume(c, "lua", "rust"))
