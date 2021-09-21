function find(word, letter, start_idx)
    index = start_idx

    while index <= length(word)
        if word[index] == letter
            return index
        end
        index = nextind(word, index)
    end

    return -1
end

println(find("Bannnannnnnannna", 'a', 3))