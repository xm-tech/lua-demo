#! /usr/local/bin/lua

print("hello")

------------ var
a = 5
print(a)
print(type(a))
a = 5.5
print(type(a))
print(type(nil))
print(type(true))

print(type(print))
print(type(type(print)))


---------- string

name = "maxm"
print(name)
print("name.length=" .. #name)
print("2" + 5)

-- 一块字符串
html = [[
	hello html
	hello html lan
]]
print(html)

----------- table

stu = {}
stu.name = "maxm"
stu.sex = 37
print("stu.name="..stu.name.."\nstu.sex="..stu.sex)
stu.name = "lfj"
print("stu.name="..stu.name.."\nstu.sex="..stu.sex)
stu["name"] = "tq"
print("stu.name="..stu.name.."\nstu.sex="..stu.sex)

fruts = {"apple", "pear", "peach"}
print(fruts[1])
for k,v in pairs(fruts) do
	print(k .. "--" .. v)
end
