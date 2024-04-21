function Person(name)
	local self = {}
	self.sex = -1

	local function init()
		self.name = name
	end

	self.sayHi = function ()
		print("hi " .. self.name)
	end

	init()
	return self
end

function Man(name)
	local self = Person(name)
	self.sex = 0

	self.work = function ()
		print(name .. " is working")
		self.sayHi()
	end
	return self
end

function Woman(name)
	local self = Person(name)
	self.sex = 1

	self.work = function ()
		print("woman of afhan dont work")
	end
end

local maxm = Person("maxm")
local lfj = Person("lfj")
lfj:sayHi()
maxm:sayHi()

local cfm = Man("cfm")
cfm:work()
