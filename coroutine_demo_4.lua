require "common"

function producer()
	while true do
		local x = io.read()
		send(x)
	end
end

function send(x)
	print("send:" .. x)
	coroutine.yield(x)
end

function consumer()
	while true do
		local x = receive()
		-- io.write(x, '\n')
	end
end

function receive()
	local status, val = coroutine.resume(produce_co)
	print("received:" .. val)
	return val
end

produce_co = coroutine.create(producer)

consumer()
