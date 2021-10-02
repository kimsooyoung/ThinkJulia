a = (1,2)
b = (3,4)
println(a,b)

b,a = a,b
println(a,b)

(x, y) = (1, 2, 3)
println(x, y)

# Error Case
# _1, _2, _3 = 1, 2

addr = "tge1375@naver.com"
nick_name, domain = split(addr, '@')
println("$nick_name // $domain")