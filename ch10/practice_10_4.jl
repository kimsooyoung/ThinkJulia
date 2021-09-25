function interior!(t)
    popfirst!(t)
    pop!(t)
    nothing
end

list = [1,2,3,4,5,6,7,8,9,10]
println(interior!(list))
println(list)