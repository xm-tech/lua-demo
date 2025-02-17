-- 二分查找算法
-- 二分查找算法的时间复杂度为O(logn)
-- 二分查找算法的前提是数组是有序的
-- 二分查找算法的思想是不断缩小查找范围,直到找到目标值
-- Created by LiaoPan on 2020-09-04 16:24:14
--

local function binary_search(arr, target)
    local left = 1
    local right = #arr
    while left <= right do
        local mid = left + math.floor((right - left) / 2)
        if arr[mid] == target then
            return mid
        elseif arr[mid] < target then
            left = mid + 1
        else
            right = mid - 1
        end
    end
    return -1
end

local arr = {1, 2, 3, 4, 5, 6, 7, 8, 9}
print(binary_search(arr, 6)) -- 6
print(binary_search(arr, 10)) -- -1

