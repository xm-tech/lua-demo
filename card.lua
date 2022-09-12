-- a module named card
local card = {}

-- 卡牌等级经验数据
local card_exp_data = { 10, 20, 30, 40, 50 }

function card.addExp(exp)
	card.exp = card.getExp() + exp
	for i = 1, #card_exp_data, 1 do
		-- print("--card_exp_data[" .. i .. "] = " .. card_exp_data[i])
		if  card.getExp() < card_exp_data[i] then
			card.level = i
			break
		end

	end
	print("card.addExp(".. exp ..")")
end

function card.getExp()
	return card.exp or 0
end

function card.setStarNum(starNum)
	card.starNum = starNum
end

function card.getStarNum()
	return card.starNum or 0
end

function card.getLevel()
	return card.level or 1
end

function card.reset()
	card.exp = 0
	card.level = 1
	card.starNum = 0
end

function card.detail()
	print("card.exp=" .. card.getExp() .. ",card.level=" .. card.getLevel() .. ",card.starNum=" .. card.getStarNum())
end


return card
