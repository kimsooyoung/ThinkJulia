function histogram(word)
    output = Dict()

    for c in word
        output[c] = get(output, c, 0) + 1
    end
    
    output
end

function printhist(dict_in)
    for c in sort(collect(keys(dict_in))) 
        println("$c $(dict_in[c])")
    end
end

my_dict = histogram("banana")
printhist(my_dict)
