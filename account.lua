-- the oo demo
local Account = {balance = 0, limit = 0}
function Account:new(o)
	o = o or {}
	-- self here is the table Account itself
	setmetatable(o, self)
	self.__index = self
	return o
end

-- equivalent to Account.deposite(self, money)
function Account:deposite(money)
	self.balance = self.balance + money
end

function Account:withdraw(money)
	if self.balance < money then
		print("withdraw fail, no enough balance", self.balance, money)
		return
	end
	self.balance = self.balance - money
end

local account0 = Account:new()
local account1 = Account:new()

print("account0.balance=", account0.balance)
print("account1.balance=", account1.balance)
account0:withdraw(100)
account0:deposite(101)
print("account0.balance=", account0.balance)
account0:withdraw(100)
print("account0.balance=", account0.balance)

account1:deposite(300)
account0:deposite(5)
print("account0.balance=", account0.balance)
print("account1.balance=", account1.balance)

-- a Account Can overdraft inherited from Account
SpecialAccount = Account:new({overdraft=1000})
print("SpecialAccount.balance=", SpecialAccount.balance, ",SpecialAccount.overdraft=", SpecialAccount.overdraft)
function SpecialAccount:withdraw(money)
	if money <= 0 then
		print("withdraw fail, money must > 0")
		return
	end

	if self.balance > money then
		self.balance = self.balance - money
		return
	end

	local to_overdraft = money - self.balance

	if self.overdraft <  to_overdraft then
		print("withdraw fail, no enough overraft")
		return
	end
	self.balance = 0
	self.overdraft = self.overdraft - to_overdraft
end
SpecialAccount:withdraw(300)
print("SpecialAccount.balance=", SpecialAccount.balance, ",SpecialAccount.overdraft=", SpecialAccount.overdraft)
