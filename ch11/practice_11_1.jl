function histogram(word)
    output = Dict()

    for c in word
        output[c] = get(output, c, 0) + 1
    end
    
    output
end

println(histogram("banana"))