--[[
	lua 可变参数 demo
]]

-- 接受传给本脚本的调用参数
local cmd_args = {...}

local function eat_fruit(person, ...)
	local args = {...}
	print(person, "u can eat these fruits:")
	for _, fruit in pairs(args) do
		print(fruit)
	end
end

eat_fruit("vimer", "apple", "orange")

print("cmd_args:")
for _, parg in pairs(cmd_args) do
	print(parg)
end
