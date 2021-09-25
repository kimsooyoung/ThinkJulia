function interior(t)
    t_copy = t[:]
    popfirst!(t_copy)
    pop!(t_copy)
    t_copy
end

list = [1,2,3,4,5,6,7,8,9,10]
println(interior(list))
println(list)