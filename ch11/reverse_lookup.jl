function histogram(word)
    output = Dict()

    for c in word
        output[c] = get(output, c, 0) + 1
    end
    
    output
end

function reverselookup(d, v)
    for key in keys(d)
        if d[key] == v
            return key
        end
    end
    error("Lookup Error")
end

h = histogram("banana")
println(reverselookup(h, 2))
println(findall(isequal(2), h))