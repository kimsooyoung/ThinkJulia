my_arr = [1,2,3,4]
my_arr2 = ["spam", 2, 3.0, my_arr]
empty = []

my_arr2[4] = nothing

# Vector is a 1-dimensional Array
println(my_arr, " ", typeof(my_arr))
println(my_arr2, " ", typeof(my_arr2))
println(empty, " ", typeof(empty))