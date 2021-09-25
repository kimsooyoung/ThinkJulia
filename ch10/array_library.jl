t = [ 'a', 'b', 'c' ]
t2 =  ['e', 'f']
t3 = [ 'e', 'f', 'r', 'w', 'a' ]

push!(t, 'd')
println(t)

append!(t, t2)
println(t)

sort(t3)
println(t3)

sort!(t3)
println(t3)
