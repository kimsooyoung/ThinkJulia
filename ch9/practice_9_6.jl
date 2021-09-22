function isabecedarian(word)
    first_index = firstindex(word)
    second_index = nextind(word, first_index)

    while second_index <= length(word)
        if word[first_index] > word[second_index]
            return false
        end

        first_index = second_index
        second_index = nextind(word, first_index)
    end

    true
end

function isabecedarian()
    for line in eachline("words.txt")    
        if isabecedarian(line) 
            println(line)
        end
    end
end


isabecedarian()