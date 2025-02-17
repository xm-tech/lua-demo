
local function partition(arr, left, right)
	local pivot = arr[right]
	local i = left - 1
	for j = left, right - 1 do
		if arr[j] < pivot then
			i = i + 1
			arr[i], arr[j] = arr[j], arr[i]
		end
	end
	arr[i + 1], arr[right] = arr[right], arr[i + 1]
	return i + 1
end

local function quick_sort(arr, left, right)
    if left < right then
	local pivot = partition(arr, left, right)
	quick_sort(arr, left, pivot - 1)
	quick_sort(arr, pivot + 1, right)
    end
end


local arr = {3, 2, 1, 4, 5, 6, 7, 8, 9}

quick_sort(arr, 1, #arr)

for i = 1, #arr do
    print(arr[i])
end

-- Output:
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
-- 8
-- 9
