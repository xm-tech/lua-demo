local co = coroutine.create(function (i)
	print("co,i="..i)
end)

print(coroutine.status(co))
coroutine.resume(co, 3)
print(coroutine.status(co))

print("----")

local co2 = coroutine.wrap(function (i)
	print("co2,i="..i)
end)
co2(1)


co3 = coroutine.create(function ()
	for i=1, 10 do
		print("co3,i=" .. i)
		if i == 3 then
			print(coroutine.status(co3))
			print(coroutine.running())
		end
		coroutine.yield()
	end
end)
coroutine.resume(co3)
coroutine.resume(co3)
coroutine.resume(co3)

print(coroutine.status(co3))
print(coroutine.running())
