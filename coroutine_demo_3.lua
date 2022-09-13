-- 基于 coroutine 实现生产者/消费者问题

require "common"

-- 协程内部的 yield 将内部的状态（生产的数据）发送到主线程
local producer = coroutine.create(function (data)
	local i = 0
	while i < 3 do
		i = i + 1
		local data = "data-"..data.."-"..i
		print("produce: ", data)
		G_sleep(1)
		-- 生产数据，并下发数据给消费者(主线程)
		coroutine.yield(data)
	end

end)


function start_consumer()
	while true do
		G_sleep(1)
		-- resume 处于主线程，外部参数(状态)传入到协程内部, 这里是 "lua" 字符串, 而 返回值 val 是收到的协同程序下发的数据, status 是结果状态
		local status, val = coroutine.resume(producer, "lua")
		if status ~= true then
			break
		end
		if val == nil then
			break
		end

		print("cosumed: ", val)
	end
end


-- 启动消费者
start_consumer()
