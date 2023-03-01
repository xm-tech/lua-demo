function foo(a)
	print("foo,a=", a)
	assert(a == 2 , "a is not 2")
	-- return 2 * a to the main coroutine
	return coroutine.yield(2 * a)
end

-- the coroutine c now was at status : yield
local c = coroutine.create(function (a, b)
	print("co.1,a="..a..",b="..b)
	foo(a + 1)
	-- return a+b , a-b to the caller, while the r, s will be the params from the next resume call
	local r, s = coroutine.yield(a + b, a - b)
	-- (r,s) == ("lua", "rustt")
	print("co.2",r,s)
	-- return b, "end" to the caller
	return b, "end"
end)

-- resume 和 yield 的配合强大之处在于，resume 处于主线程中，它将外部状态（数据）传入到协同程序内部；而 yield 则将内部的状态（数据）返回到主线程中。
-- 也即 resume 和 yield 配合， 可以拿回函数内部任何位置的状态
-- will get true, 4
print("main.1", coroutine.resume(c, 1, 2))
-- will get true, 3 , -1
print("main.2", coroutine.resume(c, 10))
-- will get true, 2, end
print("main.3", coroutine.resume(c, "lua", "rustt"))
