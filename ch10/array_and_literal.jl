# collect, split, join

my_literal = "spam"
my_arr = collect(my_literal)
println(my_arr)

my_literal = "This is for test, I love Julia"
my_split_arr = split(my_literal, " ")
println(my_split_arr)

my_list = ["Helle", "Zito", "Hello"]
my_split_arr = join(my_list, " 💨 ")
println(my_split_arr)

