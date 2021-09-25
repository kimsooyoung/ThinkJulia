# splice pop popfirst deleteat insert 

my_literal = "Hello World"
# println(splice!(my_literal, 2)) => Error

my_list = [1,2,3,4,5]
println(splice!(my_list, 2))
println(my_list)
# splice(my_list,2) => Error

my_list = [1,2,3,4,5]
println(popfirst!(my_list))
println(my_list)

my_list = [1,2,3,4,5]
println(deleteat!(my_list, 3))
println(my_list)

my_list = [1,2,3,4,5]
println(insert!(my_list, 2, 'x'))
println(my_list)

