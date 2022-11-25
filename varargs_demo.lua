--[[
	lua 可变参数 demo
]]


local function eatFruit(person, ...)
	local args = {...}
	print(person, "u can eat these fruits:")
	for _, fruit in pairs(args) do
		print(fruit)
	end
end

eatFruit("vimer", "apple", "orange")
