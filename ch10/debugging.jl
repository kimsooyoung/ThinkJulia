x = [1,2,3]

insert!(x, 1, 10)
println(x)

push!(x, 12)
println(x)

append!(x, [0,0])
println(x)

t = [3,1,2 ]
t2 = t[:]

sort!(t2)
println("$t, $t2")