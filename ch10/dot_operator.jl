a = [1,2,3]
println(a.*3)

function capitalizeAll(t)
    uppercase.(t)
end

input_literal = "Hello World"
println(capitalizeAll(input_literal))
println(input_literal)