# reduce
function addAll(t)
    total = 0

    for val in t
        total += val
    end

    total
end
println(addAll([1,2,3,4]))
println(sum([1,2,3,4]))

# map
function capitalizeAll(t)
    res = []

    for letter in t
        push!(res, uppercase(letter))
    end

    res
end
println(capitalizeAll("Hello"))

# filter
function onlyUpper(t)
    output = []

    for letter in t
        if uppercase(letter) == letter
            push!(output, letter)
        end
    end

    output 
end
println(onlyUpper("HellO"))

# 10
# 10
# Any['H', 'E', 'L', 'L', 'O']
# Any['H', 'O']