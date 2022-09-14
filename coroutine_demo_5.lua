function send(x)
	coroutine.yield(x)
end

function receive(prod)
	local status, val = coroutine.resume(prod)
	return val
end

function producer()
	return coroutine.create(function ()
		while true do
			local x = io.read()
			send(x)
		end
	end)
end

-- 此处 filter 也是1 协同程序，负责 包装过滤从 prod 收到的数据, 并真正发给消费者, 有点类似 linux pipe 的角色, 并且协同程序的切换是相当轻量级的，此处的消耗几乎和函数调用一样
function filter(prod)
	return coroutine.create(function ()
		local line = 1
		while true do
			-- 接收从生产者产生过来的数据，做些包装
			local x = receive(prod)
			x = string.format("%5d %s", line, x)
			-- 最终发给消费者
			send(x)
			line = line + 1
		end
	end)
end

function consumer(prod)
	while true do
		local v = receive(prod)
		io.write(v, '\n')
	end
end

p = producer()
local f = filter(p)
consumer(f)
