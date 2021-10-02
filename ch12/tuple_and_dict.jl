d = Dict('a'=>1, 'b'=>2, 'c'=>3)

for (key, value) in d
    println("$key => $value")
end

t = [('a', 1), ('b', 2), ('c', 3)]
dict_t = Dict(t)
println(dict_t)

simple_d = Dict(zip("abc", 1:3))
println(simple_d)

phone_book = Dict(zip(collect(zip("ABCDEFG", "abcdefg")), 10000001:10000007))

for ((last, first), number) in phone_book
    println("$last, $first : $number")
end