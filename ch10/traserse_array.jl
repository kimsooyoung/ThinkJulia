cheeses = ["Mozzarella", "Bococcini", "Camembert", "Gouda", "Cheddar", "Ricotta"]

for cheese in cheeses
    print(cheese, " ")
end

println()

for i in eachindex(cheeses)
    println(i, " ", cheeses[i])
end

for x in []
    println("This line will be never printed")
end

println("How many cheeses do you have?? : $(length(cheeses))")