word1 = "{3, 5}\n"
word2 = "Hellow Yellow Monkey This is Marshmallow"

println(strip(word1, [ '{', '}', '\n']))
println(replace(word2, "llow" => "wwww", count = 2))
# println(replace(word2, "llow" => "wwww", count = 3))