t = 'a', 'b', 'c', 'd', 'e'
println(t, typeof(t))

t1 = ('a',)
println(t1, typeof(t1))
t1_err = ('a')
println(t1_err, typeof(t1_err))

t3 = tuple(1, 'a', pi)
println(t3[1])
println(t3[2:3])

# Compare tuple
println((0,1,2) < (0,1,3))

# Error Case
t3[1] = 3
