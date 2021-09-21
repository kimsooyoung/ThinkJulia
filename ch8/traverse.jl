fruits = "🍌🍐🍎🍓🍉🍇🍈"
# fruits = "banana"

index = firstindex(fruits)

while index <= length(fruits)
    print(fruits[index], " ")
    print(index)
    global index = nextind(fruits, index)
end