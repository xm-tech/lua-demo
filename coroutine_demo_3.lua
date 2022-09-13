-- 基于 coroutine 实现生产者/消费者问题

require "common"

-- resume 处于主线程，它将外部状态（数据）传入到协程内部；而协程内部的 yield 则将内部的状态（生产的数据）发送到主线程
producer = coroutine.create(function (data)
	local i = 0
	while i < 3 do
		i = i + 1
		-- 生产数据，并下发数据给消费者(主线程)
		local data = "data-"..data.."-"..i
		print("produce: ", data)
		G_sleep(1)
		coroutine.yield(data)
	end

end)


function start_consumer()
	while true do
		G_sleep(1)
		-- resume 处于主线程，外部参数(状态)传入到协程内部, 这里是 "lua" 字符串, 而 返回值 status, val 是收到的协同程序返回的数据
		local status, val = coroutine.resume(producer, "lua")
		print("cosumed: ", status, val)
		if status ~= true then
			break
		end
	end
end


-- 启动消费者
start_consumer()
