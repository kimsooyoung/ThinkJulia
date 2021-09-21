function find(word, letter)
    index = firstindex(word)

    while index <= length(word)
        if word[index] == letter
            return index
        end
        index = nextind(word, index)
    end

    return -1
end

println(find("Hello World", 'W'))