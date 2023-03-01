local add = function (i, j)
	print("add(" .. i .. "," .. j..")")
	return i + j
end
local co = coroutine.create(function (i, j)
	local ret = add(i,j)
	return ret
end)

print("co.status:", coroutine.status(co))
local coret, coval=coroutine.resume(co, 3, 5)
print("coret:", coret, ",coval:", coval, "co.status:", coroutine.status(co))

local co2 = coroutine.wrap(function (i)
	print("wrap(co) will return a new function('co2' here), i="..i)
end)
co2(1)


co3 = coroutine.create(function ()
	for i=1, 10 do
		print("co3,i=" .. i)
		if i == 3 then
			print("co3.status=" .. coroutine.status(co3) .. ", ", coroutine.running())
		end
		-- yield the current thread, will be wakedup by resume agin
		coroutine.yield()
	end
end)
-- co3.status is suspended after co3 is created
-- 刚创建的携程，处于挂起(suspend)状态
print("co3.status="..coroutine.status(co3))
-- will wake up the current yielded coroutine
coroutine.resume(co3)
coroutine.resume(co3)
coroutine.resume(co3)

print("co3.status="..coroutine.status(co3) .. ", ", coroutine.running())
